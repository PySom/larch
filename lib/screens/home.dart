import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lagosarchdiocese/helpers/background_image_container.dart';
import 'package:lagosarchdiocese/models/user_model.dart';
import 'package:lagosarchdiocese/providers/app_data_provider.dart';
import 'package:lagosarchdiocese/providers/auth_provider.dart';
import 'package:lagosarchdiocese/screens/auth/login.dart';
import 'package:lagosarchdiocese/screens/deanery.dart';
import 'package:lagosarchdiocese/screens/donation.dart';
import 'package:lagosarchdiocese/screens/events.dart';
import 'package:lagosarchdiocese/screens/news_page.dart';
import 'package:lagosarchdiocese/screens/prayer.dart';
import 'package:lagosarchdiocese/screens/reflections.dart';
import 'package:lagosarchdiocese/screens/settings.dart';
import 'package:lagosarchdiocese/ui_widgets/circle_image.dart';
import '../ui_widgets/drawer_view.dart';
import '../ui_widgets/rounded_box.dart';
import '../ui_widgets/rounded_box_child.dart';
import '../utils/constants.dart';
import 'address.dart';

class HomePage extends StatefulWidget {
  static const String id = 'home_page_screen';
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  User user;
  @override
  void initState() {
    user = Auth.authProvider(context).user;
    super.initState();
  }

  final _scaffoldKey = GlobalKey<ScaffoldState>();
  String image;
  @override
  Widget build(BuildContext context) {
    AppData.appDataProvider(context).setLastRoute(HomePage.id);
    return WillPopScope(
      onWillPop: () => Future.value(true),
      child: Scaffold(
        key: _scaffoldKey,
        drawerScrimColor: Colors.transparent,
        drawer: DrawerView(
          children: [
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
            ListTile(
              contentPadding: EdgeInsets.zero,
              title: Text(
                'Prayer',
                style: kDrawerItemStyle,
              ),
              onTap: () {
                Navigator.of(context).pushNamed(PrayerPage.id);
              },
            ),
          ],
        ),
        body: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              BackgroundImageContainer(
                padding: kHomeTopBgPadding,
                image: AssetImage('${kImageUrl}larch_user_bg.jpg'),
                child: SafeArea(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      SizedBox(
                        height: 10.0,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          GestureDetector(
                            onTap: () {
                              _scaffoldKey.currentState.openDrawer();
                            },
                            child: Icon(Icons.dehaze),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          CircleImage(
                            url: user?.image,
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 15.0,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            'Welcome back',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 13.0,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          SizedBox(
                            height: 3.0,
                            width: double.infinity,
                          ),
                          Text(
                            user?.fullName ?? 'Anonymous User',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 22.0,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(40.0),
                child: Column(
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        RoundedBox(
                          onTap: () {
                            Navigator.of(context).pushNamed(NewsPage.id);
                          },
                          boxChild: RoundedBoxChild(
                            image: "images/newspaper.svg",
                            title: "News",
                          ),
                        ),
                        RoundedBox(
                          onTap: () {
                            Navigator.of(context).pushNamed(Deanery.id);
                          },
                          boxChild: RoundedBoxChild(
                            image: "images/church.svg",
                            title: "Deanery",
                          ),
                        ),
                        RoundedBox(
                          onTap: () {
                            Navigator.of(context).pushNamed(Reflection.id);
                          },
                          boxChild: RoundedBoxChild(
                            image: "images/reflection.svg",
                            title: "Reflections",
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        RoundedBox(
                          onTap: () {
                            Navigator.of(context).pushNamed(EventPage.id);
                          },
                          boxChild: RoundedBoxChild(
                            image: "images/events.svg",
                            title: "Events",
                          ),
                        ),
                        RoundedBox(
                          onTap: () {
                            Navigator.of(context).pushNamed(DonationPage.id);
                          },
                          boxChild: RoundedBoxChild(
                            image: "images/credit_card.svg",
                            title: "Donations",
                          ),
                        ),
                        RoundedBox(
                          onTap: () {
                            Auth.authProvider(context).isSignedIn()
                                ? Navigator.of(context).pushNamed(Settings.id)
                                : Navigator.of(context)
                                    .pushNamed(LoginScreen.id);
                          },
                          boxChild: RoundedBoxChild(
                            image: "images/settings.svg",
                            title: "Settings",
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              BackgroundImageContainer(
                height: 200.0,
                width: double.infinity,
                padding: EdgeInsets.all(16.0),
                margin: EdgeInsets.only(
                  left: 20.0,
                  right: 20.0,
                  bottom: 20.0,
                ),
                image: AssetImage('${kImageUrl}church.jpg'),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      "Welcome to the Catholic Archdiocese of Lagos App",
                      style: kParishLabelStyle,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
