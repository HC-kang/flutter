import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

void main() => runApp(MyApp());


class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    List list = [
      '06-01',
      '06-02',
      '06-03',
      '06-04',
      '06-05',
      '06-06',
    ];
    return Scaffold(
      body: ListView(
        children: [
          Image.asset(
            'images/lake.jpeg',
            width: 600,
            height: 40,
            fit: BoxFit.cover,
          ),
          YakWidget(list[0]),
          YakWidget(list[1]),
          YakWidget(list[2]),
          YakWidget(list[3]),
          YakWidget(list[4]),
          YakWidget(list[5]),
        ],
      ),
    );
  }
}

class YakWidget extends StatefulWidget {
  YakWidget(this.date);

  String date = '';

  @override
  _YakWidgetState createState() => _YakWidgetState(this.date);
}

class _YakWidgetState extends State<YakWidget> {
  _YakWidgetState(this.date);

  String date = '';

  String morning = '';
  String lunch = '';
  String dinner = '';

  Color mColor = Colors.black38;
  Color lColor = Colors.black38;
  Color dColor = Colors.black38;

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Container(
          padding: EdgeInsets.all(16),
          child: Text(
            date,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
          ),
        ),
        Container(
            color: mColor,
            padding: EdgeInsets.all(16),
            child: Column(
              children: [
                FlatButton(
                  child: Text(
                    "아침",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
                  ),
                  onPressed: () {
                    DateFormat dateFormat = DateFormat("MM-dd");
                    morning = dateFormat.format(DateTime.now());
                    mColor = Colors.lightBlueAccent;
                    setState(() {});
                  },
                  color: mColor,
                  textColor: Colors.white,
                ),
                Container(
                    padding: EdgeInsets.only(top: 12),
                    child: Text('$morning',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 10)))
              ],
            )),
        Container(
            color: lColor,
            padding: EdgeInsets.all(16),
            child: Column(
              children: [
                FlatButton(
                  child: Text(
                    "점심",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
                  ),
                  onPressed: () {
                    DateFormat dateFormat = DateFormat("MM-dd");
                    lunch = dateFormat.format(DateTime.now());
                    lColor = Colors.lightBlueAccent;
                    setState(() {});
                  },
                  color: lColor,
                  textColor: Colors.white,
                ),
                Container(
                    padding: EdgeInsets.only(top: 12),
                    child: Text('$lunch',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 10)))
              ],
            )),
        Container(
            color: dColor,
            padding: EdgeInsets.all(16),
            child: Column(
              children: [
                FlatButton(
                  child: Text(
                    "저녁",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
                  ),
                  onPressed: () {
                    DateFormat dateFormat = DateFormat("MM-dd");
                    dinner = dateFormat.format(DateTime.now());
                    dColor = Colors.lightBlueAccent;
                    setState(() {});
                  },
                  color: dColor,
                  textColor: Colors.white,
                ),
                Container(
                    padding: EdgeInsets.only(top: 12),
                    child: Text('$dinner',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 10)))
              ],
            ))
      ],
    ));
  }
}
