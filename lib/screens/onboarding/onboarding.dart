import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:lagosarchdiocese/helpers/background_image_container.dart';
import 'package:lagosarchdiocese/screens/auth/signup.dart';
import 'package:lagosarchdiocese/screens/home.dart';
import 'package:lagosarchdiocese/utils/constants.dart';

class Onboarding extends StatefulWidget {
  static const String id = 'onboarding';
  @override
  _OnboardingState createState() => _OnboardingState();
}

class _OnboardingState extends State<Onboarding> {
  final pageViewController = PageController();
  int _currentPage = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: kAccentColor,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Expanded(
              child: Center(
                child: PageView(
                  controller: pageViewController,
                  onPageChanged: (page) {
                    setState(() {
                      _currentPage = page;
                    });
                  },
                  children: <Widget>[
                    OnboardItem(
                      image: "onboard_one.jpg",
                      title: "Glory to Jesus! Honour to Mary and Joseph!",
                      indicator: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          PageNavIndicator(
                            active: _currentPage == 0,
                          ),
                          SizedBox(width: 10),
                          PageNavIndicator(
                            active: _currentPage == 1,
                          ),
                          SizedBox(width: 10),
                          PageNavIndicator(
                            active: _currentPage == 2,
                          ),
                          SizedBox(width: 10),
                        ],
                      ),
                    ),
                    OnboardItem(
                      image: "onboard_two.jpg",
                      title:
                          "Stay connected to the Archdiocese using this platform",
                      indicator: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          PageNavIndicator(
                            active: _currentPage == 0,
                          ),
                          SizedBox(width: 10),
                          PageNavIndicator(
                            active: _currentPage == 1,
                          ),
                          SizedBox(width: 10),
                          PageNavIndicator(
                            active: _currentPage == 2,
                          ),
                          SizedBox(width: 10),
                        ],
                      ),
                    ),
                    OnboardItem(
                      image: "onboard_three.jpg",
                      title: "Grow in your spirituality",
                      indicator: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          PageNavIndicator(
                            active: _currentPage == 0,
                          ),
                          SizedBox(width: 10),
                          PageNavIndicator(
                            active: _currentPage == 1,
                          ),
                          SizedBox(width: 10),
                          PageNavIndicator(
                            active: _currentPage == 2,
                          ),
                          SizedBox(width: 10),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 30.0, vertical: 10),
              child: Column(
                children: [
                  SizedBox(
                    height: 20.0,
                  ),
                  Text(
                    _currentPage < 2
                        ? 'Swipe or click next to see more'
                        : 'Go to the app or sign up',
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.white),
                  ),
                  SizedBox(
                    height: 50.0,
                  ),
                  _currentPage < 2
                      ? Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            GestureDetector(
                              onTap: () {
                                setState(() {
                                  pageViewController.jumpToPage(2);
                                });
                              },
                              child: Text(
                                'Skip',
                                style: TextStyle(
                                    color: Colors.white.withOpacity(0.5)),
                              ),
                            ),
                            GestureDetector(
                                onTap: () {
                                  if (_currentPage >= 3) {}
                                  pageViewController.nextPage(
                                    curve: Curves.easeIn,
                                    duration: Duration(milliseconds: 250),
                                  );
                                },
                                child: Icon(
                                  Icons.arrow_forward,
                                  color: Colors.white,
                                )),
                          ],
                        )
                      : Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            OutlineButton(
                              borderSide: BorderSide(
                                color: Colors.white,
                                width: 0.9,
                              ),
                              onPressed: () {
                                Navigator.of(context).pushNamedAndRemoveUntil(
                                    HomePage.id, (route) => false);
                              },
                              child: Text(
                                'Take me in',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                            SizedBox(
                              width: 15.0,
                            ),
                            FlatButton(
                              color: kButtonColor,
                              onPressed: () {
                                Navigator.of(context)
                                    .pushNamed(SignUpScreen.id);
                              },
                              child: Text(
                                'Sign up',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                              ),
                            )
                          ],
                        ),
                  SizedBox(
                    height: 12.0,
                  )
                ],
              ),
            )
          ],
        ));
  }
}

class PageNavIndicator extends StatelessWidget {
  final bool active;

  const PageNavIndicator({
    Key key,
    @required this.active,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 200),
      curve: Curves.easeIn,
      decoration: BoxDecoration(
        color: active ? kAccentColor : kPrimaryColor,
        borderRadius: new BorderRadius.circular(25.0),
      ),
      height: 10,
      width: 10,
    );
  }
}

class OnboardItem extends StatelessWidget {
  final String image;
  final String title;
  final String description;
  final Widget indicator;

  const OnboardItem(
      {Key key, this.image, this.title, this.description, this.indicator})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BackgroundImageContainer(
      image: AssetImage('$kImageUrl$image'),
      padding: const EdgeInsets.symmetric(horizontal: 30.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.end,
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          SizedBox(height: 30),
          Text(
            title,
            textAlign: TextAlign.center,
            style: Theme.of(context)
                .textTheme
                .headline6
                .copyWith(color: Colors.white),
          ),
          SizedBox(height: 15),
          Container(
            child: indicator,
          ),
          SizedBox(
            height: 15,
          )
        ],
      ),
    );
  }
}
