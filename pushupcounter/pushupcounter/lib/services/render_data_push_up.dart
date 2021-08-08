import 'package:flutter/material.dart';

class RenderDataPushUp extends StatefulWidget {
  final List<dynamic> data;
  final int previewH;
  final int previewW;
  final double screenH;
  final double screenW;

  RenderDataPushUp(
      {required this.data,
      required this.previewH,
      required this.previewW,
      required this.screenH,
      required this.screenW});
  @override
  _RenderDataPushUpState createState() => _RenderDataPushUpState();
}

class _RenderDataPushUpState extends State<RenderDataPushUp> {
  Map<String, List<double>>? inputArr;

  String excercise = 'Push Up';
  bool midCount = false;
  bool isCorrectPosture = false;
  int _counter = 0;

  Color? correctColor;
  double shoulderLY = 0;
  double shoulderRY = 0;

  // double? wristLX, wristLY, wristRX, wristRY, elbowLX, elbowRX = 0;
  double wristLX = 0;
  double wristLY = 0;
  double wristRX = 0;
  double wristRY = 0;
  double shoulderLX = 0;
  double shoulderRX = 0;
  double kneeRY = 0;
  double kneeLY = 0;
  bool pushUp = true;
  String whatToDo = '자세 확인 중...';

  var leftEyePos = Vector(0, 0);
  var rightEyePos = Vector(0, 0);
  var leftShoulderPos = Vector(0, 0);
  var rightShoulderPos = Vector(0, 0);
  var leftHipPos = Vector(0, 0);
  var rightHipPos = Vector(0, 0);
  var leftElbowPos = Vector(0, 0);
  var rightElbowPos = Vector(0, 0);
  var leftWristPos = Vector(0, 0);
  var rightWristPos = Vector(0, 0);
  var leftKneePos = Vector(0, 0);
  var rightKneePos = Vector(0, 0);
  var leftAnklePos = Vector(0, 0);
  var rightAnklePos = Vector(0, 0);

  @override
  void initState() {
    inputArr = Map();
    correctColor = Colors.grey;
    super.initState();
  }

  bool? _postureAccordingToExercise(Map<String, List<double>> poses) {
    setState(() {
      wristLX = poses['leftWrist']![0];
      wristLY = poses['leftWrist']![1];
      wristRX = poses['rightWrist']![0];
      wristRY = poses['rightWrist']![1];
      shoulderLX = poses['leftShoulder']![0];
      shoulderRX = poses['rightShoulder']![0];

      shoulderLY = poses['leftShoulder']![1];
      shoulderRY = poses['rightShoulder']![1];
      kneeLY = poses['leftKnee']![1];
      kneeRY = poses['rightKnee']![1];
    });
    if (excercise == 'Push Up') {
      if (pushUp) {
        return wristLX < 110 &&
            wristRX < 110 &&
            shoulderLX > 250 &&
            shoulderRX > 250;
        // wristLY < 240 &&
        // wristLY > 200 &&
        // wristRY < 240 &&
        // wristRY > 200;
      } else {
        return wristLY < 125 && wristRY < 125;
      }
    }
    // if (excercise == 'Push Up') {
    //   if (pushUp) {
    //     return
    //         wristLX > 280 &&
    //         wristRX < 95 &&
    //         elbowLX > 280 &&
    //         elbowRX < 95 &&
    //         wristLY < 240 &&
    //         wristLY > 200 &&
    //         wristRY < 240 &&
    //         wristRY > 200;
    //   } else {
    //     return wristLY < 125 && wristRY < 125;
    //   }
    // }
  }

  _checkCorrectPosture(Map<String, List<double>> poses) {
    if (_postureAccordingToExercise(poses)!) {
      if (!isCorrectPosture) {
        setState(() {
          isCorrectPosture = true;
          correctColor = Colors.green;
        });
      }
    } else {
      if (isCorrectPosture) {
        setState(() {
          isCorrectPosture = false;
          correctColor = Colors.red;
        });
      }
    }
  }

  Future<void> _countingLogic(Map<String, List<double>> poses) async {
    if (poses != null) {
      _checkCorrectPosture(poses);

      if (isCorrectPosture && !pushUp && midCount == false) {
        setState(() {
          whatToDo = 'Push';
          //correctColor = Colors.green;
        });
        pushUp = !pushUp;
        isCorrectPosture = false;
      }

      if (isCorrectPosture && !pushUp && midCount == false) {
        midCount = true;
        isCorrectPosture = false;
        pushUp = !pushUp;
        setState(() {
          whatToDo = 'Down';
          //correctColor = Colors.green;
        });
      }

      if (midCount && isCorrectPosture) {
        incrementCounter();
        midCount = false;
        pushUp = !pushUp;
        setState(() {
          whatToDo = 'Push';
        });
      }
    }
  }

  void incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    void _getKeyPoints(k, x, y) {
      if (k["part"] == 'leftEye') {
        leftEyePos.x = x - 230;
        leftEyePos.y = y - 45;
      }
      if (k["part"] == 'rightEye') {
        rightEyePos.x = x - 230;
        rightEyePos.y = y - 45;
      }
      if (k["part"] == 'leftShoulder') {
        leftShoulderPos.x = x - 230;
        leftShoulderPos.y = y - 45;
      }
      if (k["part"] == 'rightShoulder') {
        rightShoulderPos.x = x - 230;
        rightShoulderPos.y = y - 45;
      }
      if (k["part"] == 'leftElbow') {
        leftElbowPos.x = x - 230;
        leftElbowPos.y = y - 45;
      }
      if (k["part"] == 'rightElbow') {
        rightElbowPos.x = x - 230;
        rightElbowPos.y = y - 45;
      }
      if (k["part"] == 'leftWrist') {
        leftWristPos.x = x - 230;
        leftWristPos.y = y - 45;
      }
      if (k["part"] == 'rightWrist') {
        rightWristPos.x = x - 230;
        rightWristPos.y = y - 45;
      }
      if (k["part"] == 'leftHip') {
        leftHipPos.x = x - 230;
        leftHipPos.y = y - 45;
      }
      if (k["part"] == 'rightHip') {
        rightHipPos.x = x - 230;
        rightHipPos.y = y - 45;
      }
      if (k["part"] == 'leftKnee') {
        leftKneePos.x = x - 230;
        leftKneePos.y = y - 45;
      }
      if (k["part"] == 'rightKnee') {
        rightKneePos.x = x - 230;
        rightKneePos.y = y - 45;
      }
      if (k["part"] == 'leftAnkle') {
        leftAnklePos.x = x - 230;
        leftAnklePos.y = y - 45;
      }
      if (k["part"] == 'rightAnkle') {
        rightAnklePos.x = x - 230;
        rightAnklePos.y = y - 45;
      }
    }

    List<Widget> _renderKeypoints() {
      var lists = <Widget>[];
      widget.data.forEach((re) {
        var list = re["keypoints"].values.map<Widget>((k) {
          var _x = k["x"];
          var _y = k["y"];
          var scaleW, scaleH, x, y;

          if (widget.screenH / widget.screenW >
              widget.previewH / widget.previewW) {
            scaleW = widget.screenH / widget.previewH * widget.previewW;
            scaleH = widget.screenH;
            var difW = (scaleW - widget.screenW) / scaleW;
            x = (_x - difW / 2) * scaleW;
            y = _y * scaleH;
          } else {
            scaleH = widget.screenW / widget.previewW * widget.previewH;
            scaleW = widget.screenW;
            var difH = (scaleH - widget.screenH) / scaleH;
            x = _x * scaleW;
            y = (_y - difH / 2) * scaleH;
          }
          inputArr![k['part']] = [x, y];
          //Mirroring
          if (x > 320) {
            var temp = x - 320;
            x = 320 - temp;
          } else {
            var temp = 320 - x;
            x = 320 + temp;
          }

          _getKeyPoints(k, x, y);

          if (k["part"] == 'leftEye') {
            leftEyePos.x = x - 230;
            leftEyePos.y = y - 45;
          }
          if (k["part"] == 'rightEye') {
            rightEyePos.x = x - 230;
            rightEyePos.y = y - 45;
          }
          return Positioned(
            left: x - 230,
            top: y - 50,
            width: 100,
            height: 15,
            child: Container(
              child: Text(
                "● ${k["part"]}",
                style: TextStyle(
                  color: Colors.redAccent,
                  // color: Color.fromRGBO(37, 213, 253, 1.0),
                  fontSize: 12.0,
                ),
              ),
            ),
          );
        }).toList();

        _countingLogic(inputArr!);
        inputArr!.clear();

        lists..addAll(list);
      });
      //lists.clear();

      return lists;
    }

    return Stack(
      children: <Widget>[
        Stack(
          children: [
            CustomPaint(
              painter:
                  MyPainter(left: leftShoulderPos, right: rightShoulderPos),
            ),
            CustomPaint(
              painter: MyPainter(left: leftElbowPos, right: leftShoulderPos),
            ),
            CustomPaint(
              painter: MyPainter(left: leftWristPos, right: leftElbowPos),
            ),
            CustomPaint(
              painter: MyPainter(left: rightElbowPos, right: rightShoulderPos),
            ),
            CustomPaint(
              painter: MyPainter(left: rightWristPos, right: rightElbowPos),
            ),
            CustomPaint(
              painter: MyPainter(left: leftShoulderPos, right: leftHipPos),
            ),
            CustomPaint(
              painter: MyPainter(left: leftHipPos, right: leftKneePos),
            ),
            CustomPaint(
              painter: MyPainter(left: leftKneePos, right: leftAnklePos),
            ),
            CustomPaint(
              painter: MyPainter(left: rightShoulderPos, right: rightHipPos),
            ),
            CustomPaint(
              painter: MyPainter(left: rightHipPos, right: rightKneePos),
            ),
            CustomPaint(
              painter: MyPainter(left: rightKneePos, right: rightAnklePos),
            ),
            CustomPaint(
              painter: MyPainter(left: leftHipPos, right: rightHipPos),
            ),
          ],
        ),
        Stack(children: _renderKeypoints()),
        Align(
          alignment: Alignment.bottomCenter,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                height: 50,
                width: widget.screenW * 0.5,
                decoration: BoxDecoration(
                  color: correctColor,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(300),
                    topRight: Radius.circular(300),
                    bottomLeft: Radius.circular(300),
                    bottomRight: Radius.circular(300),
                  ),
                ),
                child: Column(
                  children: [
                    Text(
                      '$whatToDo\nPush ups: ${_counter.toString()}',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
              Container(
                height: 10,
              )
            ],
          ),
        ),
      ],
    );
  }
}

class Vector {
  double x, y;
  Vector(this.x, this.y);
}

class MyPainter extends CustomPainter {
  Vector left;
  Vector right;
  MyPainter({required this.left, required this.right});
  @override
  void paint(Canvas canvas, Size size) {
    final p1 = Offset(left.x, left.y);
    final p2 = Offset(right.x, right.y);
    final paint = Paint()
      ..color = Colors.green
      ..strokeWidth = 3;
    canvas.drawLine(p1, p2, paint);
  }

  @override
  bool shouldRepaint(CustomPainter old) {
    return false;
  }
}
