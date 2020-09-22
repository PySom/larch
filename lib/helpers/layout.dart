import 'package:flutter/material.dart';
import 'package:lagosarchdiocese/screens/home.dart';
import 'package:lagosarchdiocese/ui_widgets/nav_bar_filler.dart';

class Layout extends StatelessWidget {
  final String title;
  final List<Widget> children;
  final Widget bottomItem;
  const Layout({this.title, this.children, this.bottomItem});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: customAppBar(context, title),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    NavBarFiller(),
                    ...children,
                  ],
                ),
              ),
            ),
            Container(
              child: bottomItem,
            )
          ],
        ));
  }
}

AppBar customAppBar(BuildContext context, String title) {
  return AppBar(
    leading: GestureDetector(
      onTap: () {
        Navigator.of(context).pushNamed(HomePage.id);
      },
      child: Icon(
        Icons.arrow_back,
        color: Colors.white,
      ),
    ),
    title: Text(title),
    centerTitle: true,
  );
}
