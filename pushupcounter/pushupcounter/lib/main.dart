import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:pushupcounter/screen/screen_home.dart';
import 'package:pushupcounter/screen/home.dart';

List<CameraDescription>? cameras;
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  cameras = await availableCameras();
  runApp(new MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomeScreen(),
    );
  }
}
