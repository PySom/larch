import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'rounded_box.dart';
import 'rounded_box_child.dart';
import 'constants.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                color: const Color(0xff013C8B),
                image: DecorationImage(
                  fit: BoxFit.cover,
                  colorFilter: ColorFilter.mode(
                      Colors.black.withOpacity(0.48), BlendMode.dstATop),
                  image: AssetImage("images/background.jpg"),
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      CircleAvatar(
                        radius: 50.0,
                        backgroundImage: AssetImage('images/cike.jpg'),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 15.0,
                  ),
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
            ),
          ),
          Expanded(
            flex: 2,
            child: Container(
              color: Colors.white,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(40.0),
                    child: Column(
                      children: <Widget>[
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            RoundedBox(
                              colour: kRoundedIconColor,
                              boxChild: RoundedBoxChild(
                                image: "images/newspaper.svg",
                                title: "News",
                              ),
                            ),
                            RoundedBox(
                              colour: kRoundedIconColor,
                              boxChild: RoundedBoxChild(
                                image: "images/church.svg",
                                title: "Deanery",
                              ),
                            ),
                            RoundedBox(
                              colour: kRoundedIconColor,
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
                              colour: kRoundedIconColor,
                              boxChild: RoundedBoxChild(
                                image: "images/pray.svg",
                                title: "Prayers",
                              ),
                            ),
                            RoundedBox(
                              colour: kRoundedIconColor,
                              boxChild: RoundedBoxChild(
                                image: "images/events.svg",
                                title: "Events",
                              ),
                            ),
                            RoundedBox(
                              colour: kRoundedIconColor,
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
                  Expanded(
                    child: Container(
                      padding: EdgeInsets.all(10.0),
                      margin: EdgeInsets.all(20.0),
                      decoration: BoxDecoration(
                        color: const Color(0xff013C8B),
                        image: DecorationImage(
                          fit: BoxFit.cover,
                          image: AssetImage("images/church.jpg"),
                        ),
                      ),
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
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
