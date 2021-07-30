import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pushupcounter/main.dart';
import 'package:pushupcounter/screen/screen_camera.dart';
import 'package:pushupcounter/screen/screen_explain.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void dispose() {
    // 세로 화면 고정
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    double width = screenSize.width;
    double height = screenSize.height;

    void getServerText() {}

    return Scaffold(
      // appBar: AppBar(
      //   centerTitle: true,
      //   backgroundColor: Colors.black87,
      //   title: const Text(
      //     'PushUp Counter',
      //     style: TextStyle(
      //         fontSize: 25, fontWeight: FontWeight.bold, color: Colors.white),
      //   ),
      // ),
      backgroundColor: Colors.white,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Column(
            children: [
              Container(
                height: 160,
              ),
              Container(
                child: Column(
                  children: [
                    Text(
                      'AI 체력 검정 어플리케이션',
                      style: TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      '(Push-Up)',
                      style: TextStyle(fontSize: 23),
                    ),
                  ],
                ),
              )
            ],
          ),
          Container(
            padding: EdgeInsets.only(top: 30),
            child: Image.asset(
              'images/pushups.jpeg',
              width: width * 0.9,
              // height: ,
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: 50,
              ),
              Container(
                width: width * 0.6,
                height: height * 0.06,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).push(
                      MaterialPageRoute<Null>(
                        fullscreenDialog: true,
                        builder: (BuildContext context) {
                          return CameraScreen();
                        },
                      ),
                    );
                  },
                  style: ElevatedButton.styleFrom(primary: Colors.black54),
                  // color: Colors.black54,
                  child: Icon(
                    Icons.party_mode,
                    color: Colors.white,
                    size: width * 0.1,
                  ),
                ),
              ),
              Container(
                height: 30,
              ),
              Container(
                width: width * 0.6,
                height: height * 0.06,
                child: SizedBox(
                  width: double.infinity, // <-- match_parent
                  child: ElevatedButton(
                    child: const Text(
                      '사용법',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    style: ElevatedButton.styleFrom(
                      primary: Colors.black54,
                    ),
                    onPressed: () {
                      Navigator.of(context).push(
                        MaterialPageRoute<Null>(
                          fullscreenDialog: true,
                          builder: (BuildContext context) {
                            return ExplainScreen();
                          },
                        ),
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
