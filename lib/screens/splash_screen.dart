import 'package:flutter/material.dart';
import 'package:lagosarchdiocese/helpers/background_image_container.dart';
import 'package:lagosarchdiocese/models/app_model.dart';
import 'package:lagosarchdiocese/models/user_model.dart';
import 'package:lagosarchdiocese/providers/app_data_provider.dart';
import 'package:lagosarchdiocese/providers/auth_provider.dart';
import 'package:lagosarchdiocese/repository/hive_repository.dart';
import 'package:lagosarchdiocese/screens/home.dart';
import 'package:lagosarchdiocese/screens/onboarding/onboarding.dart';
import 'package:lagosarchdiocese/utils/constants.dart';

class SplashScreen extends StatefulWidget {
  static String id = 'splash_screen';

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  HiveRepository _hiveRepository = HiveRepository();
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
    });
    _prepareAppState();
  }

  _prepareAppState() async {
    await HiveRepository.openHives([
      kUserName,
      kAppDataName,
    ]);
    User user;
    AppModel appModel;
    try {
      user = _hiveRepository.get<User>(key: kUserName, name: kUserName);
      appModel =
          _hiveRepository.get<AppModel>(key: kAppDataName, name: kAppDataName);
    } catch (ex) {
      print(ex);
    }
    if (user == null) {
      if (appModel?.isFirstTime ?? true) {
        appModel = AppModel(
            isFirstTime: false,
            lastRoute: appModel?.lastRoute,
            token: appModel?.token);
        AppData.appDataProvider(context).setAppModel(appModel);
        Navigator.of(context).pushNamedAndRemoveUntil(
            Onboarding.id, (Route<dynamic> route) => false);
      } else {
        Navigator.of(context).pushNamedAndRemoveUntil(
            HomePage.id, (Route<dynamic> route) => false);
      }
    } else {
      AppData.appDataProvider(context).setAppModel(appModel);
      Auth.authProvider(context).setUser(user);
      Auth.authProvider(context).setToken(appModel.token);
      Navigator.of(context).pushNamedAndRemoveUntil(
          appModel?.lastRoute ?? HomePage.id, (Route<dynamic> route) => false);
    }
  }

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
                'Catholic\nArchdiocese\nof Lagos',
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
