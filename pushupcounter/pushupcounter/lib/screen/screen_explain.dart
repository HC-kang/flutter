import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ExplainScreen extends StatefulWidget {
  const ExplainScreen({Key? key}) : super(key: key);

  @override
  _ExplainScreenState createState() => _ExplainScreenState();
}

class _ExplainScreenState extends State<ExplainScreen> {
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
    return Scaffold(
      backgroundColor: Colors.grey,
      body: Container(
        child: SafeArea(
          child: Column(
            children: [
              Positioned(
                child: AppBar(
                  leading: IconButton(
                    icon: Icon(
                      Icons.arrow_back,
                      color: Colors.black,
                    ),
                    onPressed: () => Navigator.of(context).pop(),
                  ),
                  backgroundColor: Colors.transparent,
                  elevation: 0,
                ),
              ),
              Column(
                children: [
                  Container(
                    height: height * 0.09,
                  ),
                  Text(
                    '* 아래와 같이 측면에서 촬영하면 \n 더 정확한 결과를 얻을 수 있습니다.',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  Container(
                    padding: EdgeInsets.all(30),
                    child: Image.asset(
                      'images/woman_pushup.jpeg',
                      width: width * 0.9,
                      // height: ,
                    ),
                  ),
                  Text(
                    '* 이거 왜 안되냐.',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
