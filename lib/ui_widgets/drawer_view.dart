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
  @override
  Widget build(BuildContext context) {
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
                      ListTile(
                        contentPadding: EdgeInsets.zero,
                        title: Text(
                          'Home',
                          style: kDrawerItemStyle,
                        ),
                        onTap: () {
                          Navigator.of(context).pushNamedAndRemoveUntil(
                              HomePage.id, (Route<dynamic> route) => false);
                        },
                      ),
                      ListTile(
                        contentPadding: EdgeInsets.zero,
                        title: Text(
                          'Contact Us',
                          style: kDrawerItemStyle,
                        ),
                        onTap: () {
                          Navigator.of(context).pushNamed(AddressPage.id);
                        },
                      ),
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
