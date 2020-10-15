import 'dart:io';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:lagosarchdiocese/screens/home.dart';
import 'package:lagosarchdiocese/screens/main_news.dart';
import 'package:lagosarchdiocese/utils/app_routes.dart';

import 'navigator_service.dart';

class PushNotification {
  final FirebaseMessaging _fbm = FirebaseMessaging();
  final NavigationService _ns = NavigationService.service;

  void initialize() {
    if (Platform.isIOS) {
      //require IOS permission
      _fbm.requestNotificationPermissions(IosNotificationSettings());
    }

    _fbm.configure(
        //called when app is in foreground and notification comes
        onMessage: (Map<String, dynamic> message) async {
      print('onMessage: $message');
    },
        //called when app has been closed completely and it's opened from notification drawer
        onLaunch: (Map<String, dynamic> message) async {
      _serializeAndNavigate(message);
    },
        //called when app is in the background and it's opened from notification drawer
        onResume: (Map<String, dynamic> message) async {
      _serializeAndNavigate(message);
    });
  }

  void _serializeAndNavigate(Map<String, dynamic> message) {
    var notificationData = message['data'];
    var route = notificationData['view'];
    var data = notificationData['data'];
    print('$route $data');
    if (route != null) {
      //check if this view is a page in our app
      var appRouteKeys = appRoutes.keys;
      //if we have this route navigate to it
      if (!appRouteKeys.contains(route)) {
        route = HomePage.id;
      }
    }
    if (route == MainNews.id) {
      _ns.navigateTo(
          pushTo: MainNews(
        data: data,
      ));
    } else {
      _ns.navigateTo(
        routeName: route ?? HomePage.id,
        data: data,
      );
    }
  }
}
