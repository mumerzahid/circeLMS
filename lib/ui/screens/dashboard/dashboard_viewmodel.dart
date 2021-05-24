import 'dart:isolate';
import 'dart:ui';
import 'package:crice_hospital_app/app/locator.dart';
import 'package:crice_hospital_app/constants/constants_messages.dart';
import 'package:crice_hospital_app/model/dashboard.dart';
import 'package:crice_hospital_app/services/api.dart';
import 'package:crice_hospital_app/services/snackbar.dart';
import 'package:dio/dio.dart';
import 'package:ext_storage/ext_storage.dart';
import 'package:flutter_downloader/flutter_downloader.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

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

  static downloadingCallback(id, status, progress) {
    SendPort sendPort = IsolateNameServer.lookupPortByName("downloading");
    sendPort.send([id, status, progress]);
  }

  void errorListener(DashboardModel dashboard) {
    if (dashboard.success) {
      print("Successfully Dashoard");
      feedlist = dashboard.data.feeds;
      loader();
      trList = dashboard.data.trainingResources;
      loader();
      notifyListeners();
    } else {
      _passError = dashboard.message;
    }
  }

  void snackBar(String Error) {
    _snackbarService.showCustomSnackBar(
      variant: SnackbarType.universal,
      message: Error,
      duration: Duration(seconds: 2),
      onTap: (_) {
        print('snackbar tapped');
      },
      mainButtonTitle: 'Undo',
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

  Future<void> downloadFile(String link, index, bool check) async {
    Fluttertoast.showToast(msg: "Start Downloading");
    String url = ConstantsMessages.fBaseURL + link;
    print(url);
    Dio dio = Dio();
    // getStoragePermission();
    final status = await Permission.storage.request();
    if (status.isGranted) {
      String path = await ExtStorage.getExternalStoragePublicDirectory(
          ExtStorage.DIRECTORY_DOWNLOADS);

      IsolateNameServer.registerPortWithName(
          _receivePort.sendPort, "downloading");
      FlutterDownloader.registerCallback(downloadingCallback);

      final id = await FlutterDownloader.enqueue(
          url: url,
          savedDir: path,
          fileName: check ? myList[index] : "Report.pdf",
          showNotification: true,
          openFileFromNotification: true);
    } else {
      print("Permission Denied");
    }
  }

  @override
  Future futureToRun() {
    myList = <String>[];
    print("Getting Report List");
    return _api.getDashboardData().then((value) => {
          errorListener(value),
        });
  }
}
