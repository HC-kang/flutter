import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';

import 'home.dart';

class CameraScreen extends StatefulWidget {
  const CameraScreen({Key? key}) : super(key: key);

  @override
  _CameraScreenState createState() => _CameraScreenState();
}

class _CameraScreenState extends State<CameraScreen> {
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
    return Home();
    // return Scaffold(
    //   body: Container(
    //     child: SafeArea(
    //       child: Column(
    //         children: [
    //           Positioned(
    //             child: AppBar(
    //               leading: IconButton(
    //                 icon: Icon(
    //                   Icons.arrow_back,
    //                   color: Colors.black,
    //                 ),
    //                 onPressed: () => Navigator.of(context).pop(),
    //               ),
    //               backgroundColor: Colors.transparent,
    //               elevation: 0,
    //             ),
    //           ),
    //           Column(
    //             children: [
    //               Container(
    //                 height: height * 0.01,
    //               ),
    //               Container(
    //                 padding: EdgeInsets.all(15),
    //                 child: Row(
    //                   mainAxisAlignment: MainAxisAlignment.end,
    //                   children: [
    //                     Text('타이머 조절 가능하게 -> '),
    //                     Container(
    //                       width: width * 0.25,
    //                       height: height * 0.05,
    //                       decoration: BoxDecoration(
    //                           color: Colors.black12,
    //                           border: Border.all(color: Colors.black),
    //                           borderRadius: BorderRadius.circular(10)),
    //                       child: Text(
    //                         '00:00',
    //                         style: TextStyle(
    //                           fontSize: 35,
    //                           fontWeight: FontWeight.bold,
    //                         ),
    //                         textAlign: TextAlign.center,
    //                       ),
    //                     ),
    //                   ],
    //                 ),
    //               ),
    //               Container(
    //                 child: Home(),
    //               ),
    // Row(
    //   mainAxisAlignment: MainAxisAlignment.center,
    //   children: [
    //     RaisedButton(
    //       color: Colors.orange,
    //       child: Container(
    //         alignment: Alignment.center,
    //         width: width * 0.17,
    //         height: height * 0.07,
    //         child: Text(
    //           '시작',
    //           textAlign: TextAlign.center,
    //           style: TextStyle(
    //               fontSize: 30, fontWeight: FontWeight.bold),
    //         ),
    //       ),
    //       onPressed: () {},
    //     ),
    //     Container(
    //       width: width * 0.1,
    //     ),
    //     RaisedButton(
    //       color: Colors.grey,
    //       child: Container(
    //         alignment: Alignment.center,
    //         width: width * 0.17,
    //         height: height * 0.07,
    //         child: Text(
    //           '저장',
    //           textAlign: TextAlign.center,
    //           style: TextStyle(
    //               fontSize: 30, fontWeight: FontWeight.bold),
    //         ),
    //       ),
    //       onPressed: () {},
    //     ),
    //   ],
    // )
    //             ],
    //           ),
    //         ],
    //       ),
    //     ),
    //   ),
    // );
  }
}
