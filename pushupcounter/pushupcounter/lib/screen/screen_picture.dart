// import 'dart:async';
// import 'dart:io';

// import 'package:camera/camera.dart';
// import 'package:flutter/material.dart';
// import 'package:path/path.dart';
// import 'package:path_provider/path_provider.dart';

// Future<void> main() async {
//   //이용 가능한 카메라 목록 받아오기
//   final cameras = await availableCameras();

//   //이용가능한 카메로 목록에서 특정 카메라 얻기
//   final firstCamera = cameras.first;

//   runApp(MaterialApp(
//     theme: ThemeData.dark(),
//     home: TakePictureScreen(
//       //적절한 카메라를 TakePictureScreen 위젯에 전달
//       camera: firstCamera,
//     ),
//   ));
// }

// // 사용자가 주어진 카메라를 사용하여 사진을 찍을 수 있는 화면
// class TakePictureScreen extends StatefulWidget {
//   final CameraDescription camera;

//   const TakePictureScreen({
//     Key? key,
//     required this.camera,
//   }) : super(key: key);

//   @override
//   TakePictureScreenState createState() => TakePictureScreenState();
// }

// class TakePictureScreenState extends State<TakePictureScreen> {
//   //CameraController와 future를 저장하기 위해 두 개의 변수를 저장
//   CameraController? _controller;
//   Future<void>? _initializeControllerFuture;

//   @override
//   void initState() {
//     super.initState();
//     //카메라의 현재 출력물을 보여주기 위해 CameraController 생성
//     _controller = CameraController(
//       //이용 가능한 카메라 목록에서 특정 카메라 가져오기
//       widget.camera,
//       //적용할 해상도 지정
//       ResolutionPreset.medium,
//     );

//     //controller 초기화. Future를 반환?
//     _initializeControllerFuture = _controller!.initialize();
//   }

//   @override
//   void dispose() {
//     //위젯 생명주기? 종료 시 컨트롤러 해제
//     _controller!.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text('Take a picture')),
//       //카메라 프리뷰를 보여주기 전 컨트롤러 초기화를 기다려야 함. 그때까지 로딩 스피너 보여주기
//       body: FutureBuilder<void>(
//         future: _initializeControllerFuture,
//         builder: (context, snapshot) {
//           if (snapshot.connectionState == ConnectionState.done) {
//             //Future 완료되면 프리뷰 보여주기
//             return CameraPreview(_controller!);
//           } else {
//             //아니라면, 진행표시기 보여주기
//             return Center(child: CircularProgressIndicator());
//           }
//         },
//       ),
//       floatingActionButton: FloatingActionButton(
//         child: Icon(Icons.camera_alt),
//         //onPressed 콜백 제공
//         onPressed: () async {
//           //try / catch 블럭에서 사진촬영. 에러대응은 무슨소리지?
//           try {
//             //카메라 초기화 완료여부 확인
//             await _initializeControllerFuture;

//             //path 패키지를 사용해서 저장될 경로 지정
//             final path = join(
//               //임시 디렉토리에 저장 예정
//               (await getTemporaryDirectory()).path,
//               '${DateTime.now()}.png',
//             );

//             //사진 촬영 시도하고, 경로를 로그로 남기기
//             await _controller!.takePicture(path);

//             //사진 촬영 후 새로운 화면으로 넘어가기
//             Navigator.push(
//               context,
//               MaterialPageRoute(
//                 builder: (context) => DisplayPictureScreen(imagePath: path),
//               ),
//             );
//           } catch (e) {
//             //만약 에러가 발생하면 에러로그 남기기
//             print(e);
//           }
//         },
//       ),
//     );
//   }
// }

// // 사용자가 촬영한 화면을 보여주는 위젯
// class DisplayPictureScreen extends StatelessWidget {
//   final String? imagePath;
//   const DisplayPictureScreen({Key? key, this.imagePath}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text('Display the Picture')),
//       body: Image.file(File(imagePath!)),
//     );
//   }
// }
