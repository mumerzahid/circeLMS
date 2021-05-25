// import 'dart:io';
// import 'dart:isolate';
// import 'dart:ui';
// import 'package:dio/dio.dart';
// import 'package:ext_storage/ext_storage.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_downloader/flutter_downloader.dart';
// import 'package:permission_handler/permission_handler.dart';
// class MyPdf extends StatefulWidget {
//   @override
//   _MyPdfState createState() => _MyPdfState();
// }
// class _MyPdfState extends State<MyPdf> {
//   @override
//   void initState() {
//     super.initState();
//     getPermission();
//   }
//   @override
//   Widget build(BuildContext context) {
//     final imgUrl = "http://www.pdf995.com/samples/pdf.pdf";
//     var dio = Dio();
//     return Scaffold(
//       appBar: AppBar(title: Text("PDF Download")),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             RaisedButton.icon(
//               //call this on press on your download button
//               onPressed: () async {
//                 String path =
//                 await ExtStorage.getExternalStoragePublicDirectory(
//                     ExtStorage.DIRECTORY_DOWNLOADS);
//                 String fullPath = "$path/newtask2.pdf";
//                 downloadDocument(dio, imgUrl, fullPath);
//               },
//               //ignore
//               icon: Icon(
//                 Icons.download_done_outlined,
//                 color: Colors.white,
//               ),
//               color: Colors.green,
//               textColor: Colors.white,
//               label: Text("Download"),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
//   //get storage permission
//   void getPermission() async {
//     print("getPermission");
//     await PermissionHandler().requestPermissions([PermissionGroup.storage]);
//   }
//   //write this function in your viewmodel file
//   Future downloadDocument(Dio dio, String url, String savePath) async {
//     //get pdf from link
//     try {
//       Response response = await dio.get(
//         url,
//         // onReceiveProgress: showDownloadProgress,
//         //Received data with List<int>
//         options: Options(
//             responseType: ResponseType.bytes,
//             followRedirects: false,
//             validateStatus: (status) {
//               return status < 500;
//             }),
//       );
//       //write in download folder
//       File file = File(savePath);
//       var raf = file.openSync(mode: FileMode.write);
//       raf.writeFromSync(response.data);
//       await raf.close();
//     } catch (e) {
//       print("Error is");
//       print(e);
//     }
//   }
//   //ignore
//   void showDownloadProgress(received, total) {
//     if (total != -1) {
//       print((received / total * 100).toStringAsFixed(0) + "%");
//     }
//   }
// }
//
// //
//
// void main() async {
//   //write these 3 lines in your main file
//   WidgetsFlutterBinding.ensureInitialized();
//   await FlutterDownloader.initialize(
//       debug: true // optional: set false to disable printing logs to console
//   );
//   runApp(MyApp());
// }
//
// class MyApp extends StatelessWidget {
//   // This widget is the root of your application.
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Flutter Demo',
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//         visualDensity: VisualDensity.adaptivePlatformDensity,
//       ),
//       home: MyHomePage(title: 'Flutter Demo Home Page'),
//     );
//   }
// }
//
// class MyHomePage extends StatefulWidget {
//   MyHomePage({Key key, this.title}) : super(key: key);
//
//   final String title;
//
//   @override
//   _MyHomePageState createState() => _MyHomePageState();
// }
//
// class _MyHomePageState extends State<MyHomePage> {
//   int progress = 0;
//
// // // Write this before your initState
//   ReceivePort _receivePort = ReceivePort();
//
//   static downloadingCallback(id, status, progress) {
//     ///Looking up for a send port
//     SendPort sendPort = IsolateNameServer.lookupPortByName("downloading");
//
//     ///ssending the data
//     sendPort.send([id, status, progress]);
//   }
// // till here
//
//   @override
//   void initState() {
//     // TODO: implement initState
//     super.initState();
//
//     ///register a send port for the other isolates
//     // Write this inside your init func
//     IsolateNameServer.registerPortWithName(
//     _receivePort.sendPort, "downloading");
//
//     ///Listening for the data is comming other isolataes
//     // _receivePort.listen((message) {
//     //   setState(() {
//     //     progress = message[2];
//     //   });
//
//     //   print(progress);
//     // });
//
//     // Write this inside your init func
//     FlutterDownloader.registerCallback(downloadingCallback);
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(widget.title),
//       ),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: <Widget>[
//           Text(
//           "Download File Demo",
//           style: TextStyle(fontSize: 24),
//         ),
//         SizedBox(
//           height: 60,
//         ),
//         FlatButton(
//             child: Text("Start Downloading"),
//             color: Colors.redAccent,
//             textColor: Colors.white,
//
//             //replace your onPressed()
//             onPressed: () async {
//       final status = await Permission.storage.request();
//       if (status.isGranted) {
//       String path =
//       await ExtStorage.getExternalStoragePublicDirectory(
//       ExtStorage.DIRECTORY_DOWNLOADS);
//       final id = await FlutterDownloader.enqueue(
//       url: "http://www.pdf995.com/samples/pdf.pdf",
//       savedDir: path,
//       fileName: "Report.pdf",
//       showNotification: true,
//       openFileFromNotification: true,
//       );
//       } else {
//       print("Permission deined");
//       }
//       },
//       )
//       ],
//     ),
//     ),
//     );
//   }
// }



// @override
// void initState() {
//
//   IsolateNameServer.registerPortWithName(
//   _receivePort.sendPort, "downloading");
//   FlutterDownloader.registerCallback(downloadingCallback);
// }
// ////
//
//   int progress = 0;
//
//   ReceivePort _receivePort = ReceivePort();
//
//   static downloadingCallback(id, status, progress) {
//     ///Looking up for a send port
//     SendPort sendPort = IsolateNameServer.lookupPortByName("downloading");
//     ///ssending the data
//     sendPort.send([id, status, progress]);
//   }
////
//   void registerCallBack(){
//     IsolateNameServer.registerPortWithName(_receivePort.sendPort, "downloading");
//
//     FlutterDownloader.registerCallback(downloadingCallback);
//   }

// Future<String> downloadFile(String url, String fileName, String dir) async {
//   HttpClient httpClient = new HttpClient();
//   File file;
//   String filePath = '';
//   String myUrl = '';
//
//   String _localPath = (await _findLocalPath()) + Platform.pathSeparator + 'Download';
//   final savedDir = Directory(_localPath);
//   bool hasExisted = await savedDir.exists();
//   if (!hasExisted) {
//     savedDir.create();
//   }
//
//   try {
//     myUrl = url+'/'+fileName;
//     var request = await httpClient.getUrl(Uri.parse(myUrl));
//     var response = await request.close();
//     if(response.statusCode == 200) {
//       var bytes = await consolidateHttpClientResponseBytes(response);
//       String dir = (await getTemporaryDirectory()).path;
//       filePath = '$dir/$fileName';
//       file = File(filePath);
//       await file.writeAsBytes(bytes);
//     }
//     else
//       filePath = 'Error code: '+response.statusCode.toString();
//   }
//   catch(ex){
//     filePath = 'Can not fetch url';
//   }
//
//   return filePath;
// }

// void requestDownload(String link) async {
//   final taskId = await FlutterDownloader.enqueue(
//     url: link,
//     savedDir: 'the path of directory where you want to save downloaded files',
//     showNotification: true, // show download progress in status bar (for Android)
//     openFileFromNotification: true, // click on notification to open downloaded file (for Android)
//   );
// }

//
//
// get mobilw dwnload path
//   String path =
//       await ExtStorage.getExternalStoragePublicDirectory(
//   ExtStorage.DIRECTORY_DOWNLOADS);
//
//   String fullPath = "$path/newtask1.pdf";

// //get pdf from link
// Response response = await dio.get(
//   url,
//   onReceiveProgress: showDownloadProgress,
//   //Received data with List<int>
//   options: Options(
//       responseType: ResponseType.bytes,
//       followRedirects: false,
//       validateStatus: (status) {
//         return status < 500;
//       }),
// );
//
// //write in download folder
// File file = File(savePath);
// var raf = file.openSync(mode: FileMode.write);
// raf.writeFromSync(response.data);
// await raf.close();
// }
//progress bar
//   if (total != -1) {
//   print((received / total * 100).toStringAsFixed(0) + "%");
//   }

// //get storage permission
// void getPermission() async {
//   print("getPermission");
//   await PermissionHandler().requestPermissions([PermissionGroup.storage]);
// }
//
// Future download2() async {
//
//   HttpClient client = new HttpClient();
//   var _downloadData = List<int>();
//   var fileSave = new File('./crice');
//   client.getUrl(Uri.parse("http://79.143.187.147:3000/system/cms_dashboards/documents/000/000/018/original/1.png"))
//       .then((HttpClientRequest request) {
//     return request.close();
//   })
//       .then((HttpClientResponse response) {
//     response.listen((d) => _downloadData.addAll(d),
//         onDone: () {
//           fileSave.writeAsBytes(_downloadData);
//         }
//     );
//   });
// }

// String path =
//     await ExtStorage.getExternalStoragePublicDirectory(
//     ExtStorage.DIRECTORY_DOWNLOADS);
// String fullPath = "$path/CriceDocument.pdf";
// _api.downloadDocument(dio,url, fullPath);

// Card(
//   child: Column(
//     children: [
//       Container(
//         color: const Color.fromRGBO(246, 246, 246, 1),
//         height: MediaQuery.of(context).size.height * 0.2,
//         width: MediaQuery.of(context).size.width,
//         child: Image.asset('assets/images/doc.png'),
//       ),
//       ListTile(
//         title: Text(
//           "Lorem ipsum dolor sit amet, consectetur adipiscing eii",
//           style: TextStyle(
//             fontFamily: 'Open Sans',
//             fontWeight: FontWeight.w700,
//             fontSize: 13,
//             color: const Color.fromRGBO(107, 126, 130, 1),
//           ),
//         ),
//       ),
//       Divider(
//         color: Colors.grey,
//       ),
//       Align(
//         alignment: Alignment.centerRight,
//         child: Padding(
//             padding: EdgeInsets.all(10),
//             child: Text(
//               "Date: 19-09-1998",
//               style: TextStyle(
//                 fontFamily: 'Open Sans',
//                 fontWeight: FontWeight.w700,
//                 fontSize: 12,
//                 color: const Color.fromRGBO(
//                     107, 126, 130, 1),
//               ),
//             )),
//       )
//
//       // Text(""data"")
//     ],
//   ),
// )
//   ],
// ),


// void videoFlutter(String url) {
//   print(url);
//   controller = YoutubePlayerController(
//
//     initialVideoId: url,
//     // YoutubePlayer.convertUrlToId(url),
//     flags: YoutubePlayerFlags(
//       autoPlay: false,
//       isLive: false,
//       enableCaption: false,
//     ),
//   );
// }

// void youtubeFlutterVideo(String url, index){
//   String videoUrl;
//   if(url.isEmpty || url == null){
//     print("Url is Empty or Null");
//   }
//   else{
//     trVideo.add(url);
//     print(trVideo);
//     videoUrl = trVideo[index];
//     videoFlutter(videoUrl);
//     // } else {
//     //   trVideo.add(
//     //       "https://www.youtube.com/watch?v=4HRC6c5-2lQ&list=RDO8j92JbuW0Y&index=3");
//     //   // videoFlutter(trVideo, index);
//     // }
//   }
//