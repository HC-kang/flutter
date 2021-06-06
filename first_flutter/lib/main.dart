import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
          appBar: AppBar(
            title: Text('헬로 월드'),
          ),
          body: Text(
            '헬로 월드',
            style: TextStyle(fontSize: 30),
          )),
    );
  }
}

class HelloPage extends StatefulWidget {
  const HelloPage({Key? key, this.title}) : super(key: key);
  final String? title;

  @override
  _HelloPageState createState() => _HelloPageState();
}

class _HelloPageState extends State<HelloPage> {
  @override
  Widget build(BuildContext context) {
    return Text(
      widget.title,
    );
  }
}
