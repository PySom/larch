import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class NavigationService {
  final GlobalKey<NavigatorState> navigatorKey =
      new GlobalKey<NavigatorState>();

  static NavigationService _service;
  static NavigationService get service {
    if (_service == null) {
      _service = NavigationService();
    }
    return _service;
  }

  Future<dynamic> navigateTo({String routeName, dynamic data, Widget pushTo}) {
    if (pushTo != null) {
      return navigatorKey.currentState.push(
        MaterialPageRoute<Null>(
          builder: (BuildContext context) {
            return pushTo;
          },
        ),
      );
    }
    return navigatorKey.currentState
        .pushNamedAndRemoveUntil(routeName, (route) => false, arguments: data);
  }

  void goBack() {
    return navigatorKey.currentState.pop();
  }
}
