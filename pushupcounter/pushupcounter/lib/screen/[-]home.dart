// import 'package:camera/camera.dart';
// import 'package:flutter/material.dart';
// import 'package:tflite/tflite.dart';

// import '../main.dart';

// class Home extends StatefulWidget {
//   const Home({Key? key}) : super(key: key);

//   @override
//   _HomeState createState() => _HomeState();
// }

// class _HomeState extends State<Home> {
//   CameraImage? cameraImage;
//   CameraController? cameraController;
//   String output = '';

//   @override
//   void initState() {
//     super.initState();
//     loadCamera();
//     loadmodel();
//   }

//   loadCamera() {
//     cameraController = CameraController(cameras![1], ResolutionPreset.medium);
//     cameraController!.initialize().then(
//       (value) {
//         if (!mounted) {
//           return;
//         } else {
//           setState(
//             () {
//               cameraController!.startImageStream(
//                 (imageStream) {
//                   cameraImage = imageStream;
//                   runModel();
//                 },
//               );
//             },
//           );
//         }
//       },
//     );
//   }

//   runModel() async {
//     if (cameraImage != null) {
//       var predictions = await Tflite.runModelOnFrame(
//           bytesList: cameraImage!.planes.map((plane) {
//             return plane.bytes;
//           }).toList(),
//           imageHeight: cameraImage!.height,
//           imageWidth: cameraImage!.width,
//           imageMean: 127.5,
//           imageStd: 127.5,
//           rotation: 90,
//           threshold: 0.1,
//           asynch: true);
//       predictions!.forEach((element) {
//         setState(() {
//           output = element['label'];
//         });
//       });
//     }
//   }

//   loadmodel() async {
//     await Tflite.loadModel(
//         model: "assets/model.tflite", labels: "assets/labels.txt");
//   }

//   @override
//   Widget build(BuildContext context) {
//     Size screenSize = MediaQuery.of(context).size;
//     double width = screenSize.width;
//     double height = screenSize.height;

//     return Scaffold(
//       body: Column(
//         children: [
//           Padding(
//             padding: EdgeInsets.all(20),
//             child: Container(
//               height: height * 0.7,
//               width: width * 0.8,
//               child: !cameraController!.value.isInitialized
//                   ? Container()
//                   : AspectRatio(
//                       aspectRatio: cameraController!.value.aspectRatio,
//                       child: CameraPreview(cameraController!),
//                     ),
//             ),
//           ),
//           Text(
//             output,
//             style: TextStyle(
//               fontWeight: FontWeight.bold,
//               fontSize: 20,
//             ),
//           ),
//           Row(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               RaisedButton(
//                 color: Colors.orange,
//                 child: Container(
//                   alignment: Alignment.center,
//                   width: width * 0.17,
//                   height: height * 0.07,
//                   child: Text(
//                     '시작',
//                     textAlign: TextAlign.center,
//                     style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
//                   ),
//                 ),
//                 onPressed: () {},
//               ),
//               Container(
//                 width: width * 0.1,
//               ),
//               RaisedButton(
//                 color: Colors.grey,
//                 child: Container(
//                   alignment: Alignment.center,
//                   width: width * 0.17,
//                   height: height * 0.07,
//                   child: Text(
//                     '저장',
//                     textAlign: TextAlign.center,
//                     style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
//                   ),
//                 ),
//                 onPressed: () {},
//               ),
//             ],
//           )
//         ],
//       ),
//     );
//   }
// }
