import 'package:flutter/material.dart';
import 'package:lagosarchdiocese/helpers/static_layout.dart';
import 'package:lagosarchdiocese/screens/home.dart';
import 'package:lagosarchdiocese/ui_widgets/nav_bar_filler.dart';

class Layout extends StatelessWidget {
  final String title;
  final List<Widget> children;
  final Widget bottomItem;
  const Layout({this.title, this.children, this.bottomItem});
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () => onWillPop(context),
      child: Scaffold(
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
          )),
    );
  }
}

AppBar customAppBar(BuildContext context, String title, {String route}) {
  return AppBar(
    leading: GestureDetector(
      onTap: () {
        Navigator.of(context).pushNamedAndRemoveUntil(
            route ?? HomePage.id, (Route<dynamic> route) => false);
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
