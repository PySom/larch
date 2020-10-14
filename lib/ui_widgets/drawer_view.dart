import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lagosarchdiocese/models/user_model.dart';
import 'package:lagosarchdiocese/providers/auth_provider.dart';
import 'package:lagosarchdiocese/screens/auth/login.dart';
import 'package:lagosarchdiocese/utils/constants.dart';
import '../screens/address.dart';
import '../screens/donation.dart';
import '../screens/home.dart';

class DrawerView extends StatelessWidget {
  final Widget header;
  final Widget loner;
  final List<Widget> children;
  DrawerView({this.header, this.children, this.loner});
  @override
  Widget build(BuildContext context) {
    final List<Widget> thisChildren = children ?? [];
    User user = Auth.authProvider(context).user;
    return Drawer(
      child: Container(
        color: kDrawerColor.withOpacity(0.92),
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.only(
                top: 0.0, left: 40.0, right: 20.0, bottom: 40.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 10,
                ),
                Expanded(
                  child: ListView(
                    children: <Widget>[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: <Widget>[
                          GestureDetector(
                            onTap: () {
                              Navigator.of(context).pop();
                            },
                            child: Icon(Icons.clear),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 60.0,
                      ),
                      loner ?? SizedBox(),
                      if (loner != null)
                        SizedBox(
                          height: 20.0,
                        ),
                      header ?? SizedBox(),
                      ...thisChildren,
                    ],
                  ),
                ),
                ActionButton(
                  isLoggedIn: user != null,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class ActionButton extends StatelessWidget {
  final bool isLoggedIn;
  ActionButton({this.isLoggedIn});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (isLoggedIn) {
          //do logout logic
          Auth.authProvider(context).logout();
        }
        //push both routes to login screen
        Navigator.of(context).pushNamed(LoginScreen.id);
      },
      child: Text(
        isLoggedIn ? 'Logout' : 'Login',
        style: kDrawerItemStyle,
      ),
    );
  }
}
