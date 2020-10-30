import 'package:flutter/material.dart';
import 'package:lagosarchdiocese/helpers/background_image_container.dart';
import 'package:lagosarchdiocese/models/app_model.dart';
import 'package:lagosarchdiocese/models/user_model.dart';
import 'package:lagosarchdiocese/providers/app_data_provider.dart';
import 'package:lagosarchdiocese/providers/auth_provider.dart';
import 'package:lagosarchdiocese/repository/hive_repository.dart';
import 'package:lagosarchdiocese/screens/home.dart';
import 'package:lagosarchdiocese/screens/onboarding/onboarding.dart';
import 'package:lagosarchdiocese/services/push_notification.dart';
import 'package:lagosarchdiocese/utils/constants.dart';

class SplashScreen extends StatefulWidget {
  static String id = 'splash_screen';

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  HiveRepository _hiveRepository = HiveRepository();

  @override
  void initState() {
    _prepareAppState();
    super.initState();
  }

  _prepareAppState() async {
    await HiveRepository.openHives([
      kUserName,
      kAppDataName,
    ]);
    PushNotification().initialize();
    User user;
    AppModel appModel;
    try {
      user = _hiveRepository.get<User>(key: kUserName, name: kUserName);
      appModel =
          _hiveRepository.get<AppModel>(key: kAppDataName, name: kAppDataName);
    } catch (ex) {
      print(ex);
    }
    //check if we have a known user
    if (user == null) {
      //check if this new person is a first time user
      //if so, show the onboarding screen
      if (appModel?.isFirstTime ?? true) {
        print('came in here');
        appModel = AppModel(
            isFirstTime: false,
            lastRoute: appModel?.lastRoute,
            token: appModel?.token);
        AppData.appDataProvider(context).setAppModel(appModel);
        Navigator.of(context).pushNamedAndRemoveUntil(
            Onboarding.id, (Route<dynamic> route) => false);
      } else {
        AppData.appDataProvider(context).setAppModel(appModel);
        Navigator.of(context).pushNamedAndRemoveUntil(
            appModel?.lastRoute ?? HomePage.id,
            (Route<dynamic> route) => false);
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
                height: 100,
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
