import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      title: 'Named routes Demo',
      // "/"을 앱이 시작하게 될 route로 지정합니다. 본 예제에서는 FirstScreen 위젯이 첫 번째 페이지가
      // 될 것입니다.
      initialRoute: '/',
      routes: {
        // When we navigate to the "/" route, build the FirstScreen Widget
        // "/" Route로 이동하면, FirstScreen 위젯을 생성합니다.
        '/': (context) => FirstScreen(),
        // "/second" route로 이동하면, SecondScreen 위젯을 생성합니다.
        '/second': (context) => Page1(),
        '/third': (context) => Page2(),
        '/forth': (context) => Page3(),
        '/fifth': (context) => Page4(),
      },
    ),
  );
}

class FirstScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('First Screen'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              child: Text('Page1'),
              onPressed: () {
                // Named route를 사용하여 두 번째 화면으로 전환합니다.
                Navigator.pushNamed(context, '/second');
              },
            ),
            ElevatedButton(
              child: Text('Page2'),
              onPressed: () {
                // Named route를 사용하여 두 번째 화면으로 전환합니다.
                Navigator.pushNamed(context, '/third');
              },
            ),
            ElevatedButton(
              child: Text('Page3'),
              onPressed: () {
                // Named route를 사용하여 두 번째 화면으로 전환합니다.
                Navigator.pushNamed(context, '/forth');
              },
            ),
          ],
        ),
      ),
    );
  }
}

class SecondScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Second Screen"),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            // 현재 route를 스택에서 제거함으로써 첫 번째 스크린으로 되돌아 갑니다.
            Navigator.pop(context);
          },
          child: Text('Go back!'),
        ),
      ),
    );
  }
}

class Page1 extends StatelessWidget {
  const Page1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: DecoratedBox(
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/yuna1.jpeg'), fit: BoxFit.cover),
        ),
        child: Center(
          child: IconButton(
            icon: Icon(Icons.info_outline_rounded),
            onPressed: () {
              Navigator.pop(context);
              // Navigator.of(context).push(_createRoute3());
            },
          ),
        ),
      ),
    );
  }
}

class Page2 extends StatelessWidget {
  const Page2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: DecoratedBox(
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/yuna2.jpeg'), fit: BoxFit.cover),
        ),
        child: Center(
          child: IconButton(
            icon: Icon(Icons.info_outline_rounded),
            onPressed: () {
              Navigator.pop(context);
              // Navigator.of(context).push(_createRoute3());
            },
          ),
        ),
      ),
    );
  }
}

class Page3 extends StatelessWidget {
  const Page3({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: DecoratedBox(
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/yuna3.jpeg'), fit: BoxFit.cover),
        ),
        child: Center(
          child: IconButton(
            icon: Icon(Icons.info_outline_rounded),
            onPressed: () {
              Navigator.pop(context);
              // Navigator.of(context).push(_createRoute3());
            },
          ),
        ),
      ),
    );
  }
}
