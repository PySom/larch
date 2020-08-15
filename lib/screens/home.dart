import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lagosarchdiocese/helpers/background_image_container.dart';
import 'package:lagosarchdiocese/screens/events.dart';
import 'package:lagosarchdiocese/screens/news_page.dart';
import 'package:lagosarchdiocese/screens/prayer.dart';
import 'package:lagosarchdiocese/ui_widgets/circle_image.dart';
import '../ui_widgets/drawer_view.dart';
import '../ui_widgets/rounded_box.dart';
import '../ui_widgets/rounded_box_child.dart';
import '../utils/constants.dart';

class HomePage extends StatefulWidget {
  static const String id = 'home_page_screen';
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  String image;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      drawerScrimColor: Colors.transparent,
      drawer: DrawerView(),
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
                      mainAxisAlignment: MainAxisAlignment.end,
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
                          url: image,
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
                          'Anonymous User',
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
                        boxChild: RoundedBoxChild(
                          image: "images/church.svg",
                          title: "Deanery",
                        ),
                      ),
                      RoundedBox(
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
                          Navigator.of(context).pushNamed(PrayerPage.id);
                        },
                        boxChild: RoundedBoxChild(
                          image: "images/pray.svg",
                          title: "Prayers",
                        ),
                      ),
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
    );
  }
}