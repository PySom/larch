import 'package:flutter/material.dart';
import 'package:lagosarchdiocese/ui_widgets/nav_bar_filler.dart';

class Layout extends StatelessWidget {
  final String title;
  final List<Widget> children;
  const Layout({this.title, this.children});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            NavBarFiller(),
            ...children,
          ],
        ),
      ),
    );
  }
}
