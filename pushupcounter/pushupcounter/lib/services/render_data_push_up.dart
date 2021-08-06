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
  double upperRange = 300;
  double lowerRange = 500;
  bool? midCount, isCorrectPosture;
  int _counter = 0;
  Color? correctColor;
  double? shoulderLY;
  double? shoulderRY;

  double? wristLX, wristLY, wristRX, wristRY, elbowLX, elbowRX;
  double? kneeRY;
  double? kneeLY;
  bool? squatUp;
  String whatToDo = 'Finding Posture';

  var rightEyePos = Vector(0, 0);
  var leftEyePos = Vector(0, 0);
  var rightShoulderPos = Vector(0, 0);
  var leftShoulderPos = Vector(0, 0);
  var rightHipPos = Vector(0, 0);
  var leftHipPos = Vector(0, 0);
  var rightElbowPos = Vector(0, 0);
  var leftElbowPos = Vector(0, 0);
  var rightWristPos = Vector(0, 0);
  var leftWristPos = Vector(0, 0);
  var rightKneePos = Vector(0, 0);
  var leftKneePos = Vector(0, 0);
  var rightAnklePos = Vector(0, 0);
  var leftAnklePos = Vector(0, 0);

  @override
  void initState() {
    inputArr = new Map();
    midCount = false;
    isCorrectPosture = false;
    _counter = 0;
    correctColor = Colors.red;
    shoulderLY = 0;
    shoulderRY = 0;
    kneeRY = 0;
    kneeLY = 0;
    squatUp = true;
    super.initState();
  }

  bool? _postureAccordingToExercise(Map<String, List<double>> poses) {
    setState(() {
      wristLX = poses['rightWrist']![0];
      wristLY = poses['rightWrist']![1];
      wristRX = poses['leftWrist']![0];
      wristRY = poses['leftWrist']![1];
      elbowLX = poses['rightElbow']![0];
      elbowRX = poses['leftElbow']![0];

      shoulderLY = poses['rightShoulder']![1];
      shoulderRY = poses['leftShoulder']![1];
      kneeLY = poses['rightKnee']![1];
      kneeRY = poses['leftKnee']![1];
    });
    if (excercise == 'Push Up') {
      if (squatUp!) {
        return wristLX! > 280 &&
            elbowLX! > 280 &&
            wristRX! < 95 &&
            elbowRX! < 95 &&
            wristLY! < 240 &&
            wristLY! > 200 &&
            wristRY! < 240 &&
            wristRY! > 200;
      } else {
        return wristLY! < 125 && wristRY! < 125;
      }
    }
  }

  _checkCorrectPosture(Map<String, List<double>> poses) {
    if (_postureAccordingToExercise(poses)!) {
      if (!isCorrectPosture!) {
        setState(() {
          isCorrectPosture = true;
          correctColor = Colors.green;
        });
      }
    } else {
      if (isCorrectPosture!) {
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

      if (isCorrectPosture! && squatUp! && midCount == false) {
        //in correct initial posture
        setState(() {
          whatToDo = 'Lift';
          //correctColor = Colors.green;
        });
        squatUp = !squatUp!;
        isCorrectPosture = false;
      }

      //lowered all the way
      if (isCorrectPosture! && !squatUp! && midCount == false) {
        midCount = true;
        isCorrectPosture = false;
        squatUp = !squatUp!;
        setState(() {
          whatToDo = 'Drop';
          //correctColor = Colors.green;
        });
      }

      //back up
      if (midCount! && isCorrectPosture!) {
        incrementCounter();
        midCount = false;
        squatUp = !squatUp!;
        setState(() {
          whatToDo = 'Lift';
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
      if (k["part"] == 'rightEye') {
        rightEyePos.x = x - 230;
        rightEyePos.y = y - 45;
      }
      if (k["part"] == 'leftEye') {
        leftEyePos.x = x - 230;
        leftEyePos.y = y - 45;
      }
      if (k["part"] == 'rightShoulder') {
        rightShoulderPos.x = x - 230;
        rightShoulderPos.y = y - 45;
      }
      if (k["part"] == 'leftShoulder') {
        leftShoulderPos.x = x - 230;
        leftShoulderPos.y = y - 45;
      }
      if (k["part"] == 'rightElbow') {
        rightElbowPos.x = x - 230;
        rightElbowPos.y = y - 45;
      }
      if (k["part"] == 'leftElbow') {
        leftElbowPos.x = x - 230;
        leftElbowPos.y = y - 45;
      }
      if (k["part"] == 'rightWrist') {
        rightWristPos.x = x - 230;
        rightWristPos.y = y - 45;
      }
      if (k["part"] == 'leftWrist') {
        leftWristPos.x = x - 230;
        leftWristPos.y = y - 45;
      }
      if (k["part"] == 'rightHip') {
        rightHipPos.x = x - 230;
        rightHipPos.y = y - 45;
      }
      if (k["part"] == 'leftHip') {
        leftHipPos.x = x - 230;
        leftHipPos.y = y - 45;
      }
      if (k["part"] == 'rightKnee') {
        rightKneePos.x = x - 230;
        rightKneePos.y = y - 45;
      }
      if (k["part"] == 'leftKnee') {
        leftKneePos.x = x - 230;
        leftKneePos.y = y - 45;
      }
      if (k["part"] == 'rightAnkle') {
        rightAnklePos.x = x - 230;
        rightAnklePos.y = y - 45;
      }
      if (k["part"] == 'leftAnkle') {
        leftAnklePos.x = x - 230;
        leftAnklePos.y = y - 45;
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

          if (k["part"] == 'rightEye') {
            rightEyePos.x = x - 230;
            rightEyePos.y = y - 45;
          }
          if (k["part"] == 'leftEye') {
            leftEyePos.x = x - 230;
            leftEyePos.y = y - 45;
          }
          return Positioned(
            right: x - 230,
            top: y - 50,
            width: 100,
            height: 15,
            child: Container(
                // child: Text(
                //   "● ${k["part"]}",
                //   style: TextStyle(
                //     color: Color.fromRGBO(37, 213, 253, 1.0),
                //     fontSize: 12.0,
                //   ),
                // ),
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
                  MyPainter(right: rightShoulderPos, left: leftShoulderPos),
            ),
            CustomPaint(
              painter: MyPainter(right: rightElbowPos, left: rightShoulderPos),
            ),
            CustomPaint(
              painter: MyPainter(right: rightWristPos, left: rightElbowPos),
            ),
            CustomPaint(
              painter: MyPainter(right: leftElbowPos, left: leftShoulderPos),
            ),
            CustomPaint(
              painter: MyPainter(right: leftWristPos, left: leftElbowPos),
            ),
            CustomPaint(
              painter: MyPainter(right: rightShoulderPos, left: rightHipPos),
            ),
            CustomPaint(
              painter: MyPainter(right: rightHipPos, left: rightKneePos),
            ),
            CustomPaint(
              painter: MyPainter(right: rightKneePos, left: rightAnklePos),
            ),
            CustomPaint(
              painter: MyPainter(right: leftShoulderPos, left: leftHipPos),
            ),
            CustomPaint(
              painter: MyPainter(right: leftHipPos, left: leftKneePos),
            ),
            CustomPaint(
              painter: MyPainter(right: leftKneePos, left: leftAnklePos),
            ),
            CustomPaint(
              painter: MyPainter(right: rightHipPos, left: leftHipPos),
            ),
          ],
        ),
        Stack(children: _renderKeypoints()),
        Align(
          alignment: Alignment.bottomCenter,
          child: Container(
            height: 50,
            width: widget.screenW,
            decoration: BoxDecoration(
              color: correctColor,
              borderRadius: BorderRadius.only(
                  topRight: Radius.circular(25.0),
                  topLeft: Radius.circular(25)),
            ),
            child: Column(
              children: [
                Text(
                  '$whatToDo\nPush ups: ${_counter.toString()}',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ],
            ),
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
  Vector right;
  Vector left;
  MyPainter({required this.right, required this.left});
  @override
  void paint(Canvas canvas, Size size) {
    final p1 = Offset(right.x, right.y);
    final p2 = Offset(left.x, left.y);
    final paint = Paint()
      ..color = Colors.blue
      ..strokeWidth = 4;
    canvas.drawLine(p1, p2, paint);
  }

  @override
  bool shouldRepaint(CustomPainter old) {
    return false;
  }
}
