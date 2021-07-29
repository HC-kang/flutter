import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String returnText = 'ha ha ha';

  void getServerText() {}

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    double width = screenSize.width;
    double height = screenSize.height;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black87,
        title: const Text(
          'PushUp Counter',
          style: TextStyle(
              fontSize: 25, fontWeight: FontWeight.bold, color: Colors.white),
        ),
      ),
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.all(30),
          ),
          Container(
            padding: EdgeInsets.all(50),
            child: Image.asset(
              'images/pushupslogo.png',
              width: width * 0.5,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              FlatButton(
                onPressed: () {},
                child: Icon(Icons.party_mode_sharp),
              )
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                  width: width * 0.5,
                  padding: EdgeInsets.all(30),
                  child: SizedBox(
                      width: double.infinity, // <-- match_parent
                      child: FlatButton(onPressed: () {}, child: Text('사용법')))),
            ],
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: getServerText,
        tooltip: 'get Text',
        child: const Icon(Icons.add),
      ),
    );
  }
}
