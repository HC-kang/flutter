import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pushupcounter/main.dart';
import 'package:pushupcounter/screen/%5B-%5Dscreen_camera.dart';
import 'package:pushupcounter/screen/screen_explain.dart';
import 'package:pushupcounter/widget/navigation_drawer.dart';

import '../pushed_page.dart';

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
      appBar: AppBar(backgroundColor: Colors.grey),
      drawer: NavigationDrawerWidget(),
      // appBar: AppBar(
      //   centerTitle: true,
      //   backgroundColor: Colors.black87,
      //   title: const Text(
      //     'PushUp Counter',
      //     style: TextStyle(
      //         fontSize: 25, fontWeight: FontWeight.bold, color: Colors.white),
      //   ),
      // ),
      backgroundColor: Color.fromRGBO(140, 140, 140, 1.0),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Column(
            children: [
              Container(
                height: 80,
              ),
              Container(
                child: Column(
                  children: [
                    Text(
                      '감독관',
                      style: TextStyle(
                        fontSize: 45,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      '(Push-Up)',
                      style: TextStyle(fontSize: 25),
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
                    onSelectA(context: context, modelName: 'posenet');
                  },
                  style: ElevatedButton.styleFrom(primary: Colors.black26),
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
                      primary: Colors.black26,
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

void onSelectA({BuildContext? context, String? modelName}) async {
  Navigator.push(
    context!,
    MaterialPageRoute(
      builder: (context) => PushedPageA(
        cameras: cameras!,
        title: modelName!,
      ),
    ),
  );
}
