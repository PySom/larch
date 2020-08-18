import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:lagosarchdiocese/helpers/background_image_container.dart';
import 'package:lagosarchdiocese/screens/onboarding/onboarding.dart';
import 'package:lagosarchdiocese/utils/constants.dart';

class SplashScreen extends StatefulWidget {
  static String id = 'splash_screen';

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  AnimationController controller;
  Animation animation;

  @override
  void initState() {
    super.initState();

    controller = AnimationController(
      duration: Duration(seconds: 2),
      vsync: this,
    );

    controller.forward();

    controller.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        controller.reverse(from: 1.0);
      } else if (status == AnimationStatus.dismissed) {
        controller.forward();
      }
    });
    controller.addListener(() {
      setState(() {});
      if (controller.value == 1) {
        Navigator.of(context)
            .pushNamedAndRemoveUntil(Onboarding.id, (route) => false);
      }
    });
    _prepareAppState();
  }

  _prepareAppState() {}

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BackgroundImageContainer(
        image: AssetImage('${kImageUrl}larch_user_bg.jpg'),
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                width: double.infinity,
              ),
              Image(
                image: AssetImage('${kImageUrl}logo.png'),
                height: controller.value * 100,
              ),
              SizedBox(
                height: 20.0,
              ),
              Text(
                'Catholic',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w700,
                  fontSize: 20,
                ),
              ),
              Text(
                'Archdiocese',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w700,
                  fontSize: 20,
                ),
              ),
              Text(
                'of Lagos',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w700,
                  fontSize: 20,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
