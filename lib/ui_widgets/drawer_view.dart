import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lagosarchdiocese/utils/constants.dart';
import '../screens/address.dart';
import '../screens/donation.dart';
import '../screens/home.dart';

class DrawerView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        color: kDrawerColor.withOpacity(0.92),
        child: SafeArea(
          child: ListView(
            padding:
                EdgeInsets.only(left: 20, right: 20, top: 10, bottom: 20.0),
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
                height: 80.0,
              ),
              ListTile(
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
                title: Text(
                  'Donations',
                  style: kDrawerItemStyle,
                ),
                onTap: () {
                  Navigator.of(context).pushNamed(DonationPage.id);
                },
              ),
              ListTile(
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
      ),
    );
  }
}
