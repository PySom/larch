import 'package:flutter/material.dart';
import 'package:lagosarchdiocese/screens/home.dart';

import 'layout.dart';

class StaticLayout extends StatelessWidget {
  final String title;
  final Color color;
  final List<Widget> children;
  const StaticLayout({this.title, this.children, this.color});

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () => onWillPop(context),
      child: Scaffold(
        backgroundColor: color,
        appBar: customAppBar(context, title),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            ...children,
          ],
        ),
      ),
    );
  }
}

Future<bool> onWillPop(BuildContext context, {String route}) {
  print(route);
  Navigator.of(context).pushNamedAndRemoveUntil(
      route ?? HomePage.id, (Route<dynamic> route) => false);
  return Future.value(false);
}
