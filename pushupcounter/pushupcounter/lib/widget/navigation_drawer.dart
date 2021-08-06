import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class NavigationDrawerWidget extends StatelessWidget {
  final padding = EdgeInsets.symmetric(horizontal: 20);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        color: Color.fromRGBO(220, 220, 220, 0),
        child: ListView(
          children: [
            DrawerHeader(
              child: UserAccountsDrawerHeader(
                accountName: Text(
                  'ex',
                  style: (TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                ),
                accountEmail: Text(
                  'ddd@gmail.com',
                  style: TextStyle(fontSize: 15),
                ),
                currentAccountPicture: CircleAvatar(
                  backgroundImage: AssetImage('images/yunakim.jpeg'),
                ),
              ),
            ),
            ListTile(
              leading: Icon(CupertinoIcons.home),
              title: Text(
                'Home',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
            ListTile(
              leading: Icon(CupertinoIcons.chart_pie_fill),
              title: Text(
                'Stat',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
            ListTile(
              leading: Icon(CupertinoIcons.mail),
              title: Text(
                'Mail',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            )
          ],
        ),
      ),
    );
  }
}
