import 'dart:async';
import 'dart:isolate';
import 'dart:typed_data';
import 'dart:io';
import 'package:crice_hospital_app/app/locator.dart';
import 'package:crice_hospital_app/model/dashboard.dart';
import 'package:crice_hospital_app/services/api.dart';
import 'package:crice_hospital_app/services/snackbar.dart';
import 'package:http/http.dart' as http;
import 'package:open_file/open_file.dart';
import 'package:path_provider/path_provider.dart';
import 'package:progress_dialog/progress_dialog.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
import 'package:permission_handler/permission_handler.dart';


enum DownloadStatus { NotStarted, Started, Downloading, Completed }

class DashboardViewModel extends FutureViewModel {
  YoutubePlayerController controller;
  final Api _api = locator<Api>();
  List<Feeds> feedlist = new List();
  List<String> myList = List<String>();
  List<TrainingResources> trList = new List();
  final SnackbarService _snackbarService = locator<SnackbarService>();
  ReceivePort _receivePort = ReceivePort();

  String fileName;

  String _emailError;
  String get emailError => _emailError;

  String _passError;
  String get passError => _passError;

  bool _isLoading = true;
  bool get isLoading => _isLoading;

  //new one
  StreamSubscription _downloadSubscription;
  DownloadStatus _downloadStatus = DownloadStatus.NotStarted;
  int _downloadPercentage = 0;
  String _downloadedFile = "";

  int get downloadPercentage => _downloadPercentage;
  DownloadStatus get downloadStatus => _downloadStatus;
  String get downloadedFile => _downloadedFile;

  void errorListener(DashboardModel dashboard) {
    if (dashboard.success && dashboard.data != null) {
      print("Successfully Dashoard");
      feedlist = dashboard.data.feeds;
      loader();
      trList = dashboard.data.trainingResources;
      loader();
      notifyListeners();
    } else {
      loader();
      _passError = dashboard.message;
      snackBar(_passError);
    }
  }

  bool dataStatus(){
    if(feedlist.isEmpty && trList.isEmpty){
      return false;
    }
    return true;
  }
  bool feedStatus(){
    if(feedlist.isEmpty){
      return true;
    }
    return false;
  }
  bool trStatus(){
    if(trList.isEmpty){
      return true;
    }
    return false;
  }

  void snackBar(String Error) {
    _snackbarService.showCustomSnackBar(
      variant: SnackbarType.universal,
      message: Error,
      duration: Duration(seconds: 2),
      onTap: (_) {
        print('snackbar tapped');
      },
      mainButtonTitle: '',
      onMainButtonTapped: () => print('Undo the action!'),
    );
  }

  List<String> splittingString(String text) {
    if (text.isNotEmpty) {
      List<String> result = text.split('.');
      fileName = result[0] + "." + result[1];
      myList.add(fileName);
    } else {
      fileName = "temp";
      myList.add(fileName);
    }

    return myList;
  }

  void getStoragePermission() async {
    print("getPermission");
  }

  void loader() {
    _isLoading = false;
  }

  Future downloadFile(context, String url, String filename) async {
    ProgressDialog pr;
    pr = new ProgressDialog(context, type: ProgressDialogType.Normal);
    pr.style(message: "Start Downloading....");
    bool _permissionReady = await _checkPermission();
    final Completer<void> completer = Completer<void>();

    if (!_permissionReady) {
      _checkPermission().then((hasGranted) {
        _permissionReady = hasGranted;
      });
    } else {
      var httpClient = http.Client();
      var request = new http.Request('GET', Uri.parse(url));
      var response = httpClient.send(request);

      final dir = Platform.isAndroid
          ? '/sdcard/download'
          : (await getApplicationSupportDirectory()).path;
      print(dir);

      List<List<int>> chunks = new List();
      int downloaded = 0;

      // updateDownloadStatus(DownloadStatus.Started);
      await pr.show();

      _downloadSubscription =
          response.asStream().listen((http.StreamedResponse r) {
        // updateDownloadStatus(DownloadStatus.Downloading);
        r.stream.listen((List<int> chunk) async {
          // Display percentage of completion
          pr.update(message: "Please wait $_downloadPercentage");
          print('downloadPercentage onListen : $_downloadPercentage');

          chunks.add(chunk);
          downloaded += chunk.length;
          _downloadPercentage = (downloaded / r.contentLength * 100).round();
          notifyListeners();
        },
            onDone: () async {
          // Display percentage of completion
          _downloadPercentage = (downloaded / r.contentLength * 100).round();
          notifyListeners();
          pr.update(message: "Downloading complete $_downloadPercentage");
          print('downloadPercentage onDone: $_downloadPercentage');

          // Save the file
          File file = new File('$dir/$filename');

          _downloadedFile = '$dir/$filename';
          print("Downloaded File " + _downloadedFile);
          pr.hide();

          final Uint8List bytes = Uint8List(r.contentLength);
          int offset = 0;
          for (List<int> chunk in chunks) {
            bytes.setRange(offset, offset + chunk.length, chunk);
            offset += chunk.length;
          }
          await file.writeAsBytes(bytes);
          if (_downloadPercentage == 100) {
            OpenFile.open(_downloadedFile);
          }

          // updateDownloadStatus(DownloadStatus.Completed);
          _downloadSubscription?.cancel();
          _downloadPercentage = 0;

          notifyListeners();

          print('DownloadFile: Completed');
          completer.complete();

          return;
        });
      });
    }

    await completer.future;
  }


  Future<bool> _checkPermission() async {
    if (await Permission.storage.request().isGranted) {
        return true;
    } else if (await Permission.storage.request().isPermanentlyDenied) {
      await openAppSettings();
    } else if (await Permission.storage.request().isDenied) {
        return false;
    }
  }

  // Future<bool> _checkPermission() async {
  //   if (Permission.storage.isGranted != null) {
  //     if (await Permission.storage.isGranted ?? false) {
  //       Permission.storage.request();
  //     } else {
  //       return true;
  //     }
  //   }
  //
  //   return false;
  // }

  @override
  Future futureToRun() {
    myList = <String>[];
    print("Getting Report List");
    return _api.getDashboardData().then((value) => {
          errorListener(value),
        });
  }
}


// showDialog(
//     context: context,
//     builder: (BuildContext context) {
//       return Dialog(
//           shape: RoundedRectangleBorder(
//               borderRadius:
//                   BorderRadius.circular(10.0)), //this right here
//           child: FileOpeningDialog(
//             path: _downloadedFile,
//           ));
//     });
