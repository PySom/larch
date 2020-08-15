import 'package:flutter/material.dart';

class StaticLayout extends StatelessWidget {
  final String title;
  final Color color;
  final List<Widget> children;
  const StaticLayout({this.title, this.children, this.color});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: color,
      appBar: AppBar(
        title: Text(title),
        centerTitle: true,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          ...children,
        ],
      ),
    );
  }
}
