import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class NavigationDrawerWidget extends StatelessWidget {
  final padding = const EdgeInsets.symmetric(horizontal: 20);

  const NavigationDrawerWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    double width = screenSize.width;
    double height = screenSize.height;

    return Drawer(
      child: Container(
        color: Colors.black54,
        child: ListView(
          children: [
            DrawerHeader(
              decoration: BoxDecoration(color: Colors.black87),
              child: UserAccountsDrawerHeader(
                decoration: BoxDecoration(color: Colors.black87),
                accountName: Text(
                  'Yuna Kim',
                  style: (TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                ),
                accountEmail: Text(
                  'yunakim@gmail.com',
                  style: TextStyle(fontSize: 15),
                ),
                currentAccountPicture: CircleAvatar(
                  backgroundImage: AssetImage('images/yunakim.jpeg'),
                ),
              ),
            ),
            ListTile(
              leading: Icon(
                CupertinoIcons.home,
                color: Colors.white,
              ),
              title: Text(
                'Home',
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
            ),
            ListTile(
              leading: Icon(CupertinoIcons.chart_pie_fill, color: Colors.white),
              title: Text(
                'Stats',
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
            ),
            ListTile(
              leading: Icon(CupertinoIcons.rectangle_dock, color: Colors.white),
              title: Text(
                'Records',
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
            ),
            Container(
              height: height * 0.45,
            ),
            ListTile(
              leading: Icon(CupertinoIcons.settings_solid, color: Colors.white),
              title: Text(
                'Setting',
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
