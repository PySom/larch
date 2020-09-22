import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:lagosarchdiocese/Exceptions/api_failure_exception.dart';
import 'package:lagosarchdiocese/models/app_model.dart';
import 'package:lagosarchdiocese/models/user_model.dart';
import 'package:lagosarchdiocese/repository/hive_repository.dart';
import 'package:lagosarchdiocese/services/network_helper.dart';
import 'package:lagosarchdiocese/utils/constants.dart';
import 'package:provider/provider.dart';

class Auth extends ChangeNotifier {
  NetworkHelper _helper = NetworkHelper();
  HiveRepository _hiveRepository = HiveRepository();
  User _user;
  String _token;
  List<dynamic> _categories;

  User get user => _user;
  String get token => _token;
  List<dynamic> get category => _categories;

  setUser(User user) => _user = user;
  setToken(String token) => _token = token;
  setCategory(List<dynamic> category) => _categories = category;

  static Auth authProvider(BuildContext context, {bool listen = false}) =>
      Provider.of<Auth>(context, listen: listen);

  Future<void> loginUser(String email, String password) async {
    try {
      var data = await _helper.loginUser(email, password);
      _setInitialData(data);
    } catch (ex) {
      throw ApiFailureException(ex);
    }
  }

  Future<void> registerUser(String name, String email, String password) async {
    try {
      var data = await _helper.registerUser(name, email, password);
      _setInitialData(data);
      print(_token);
    } catch (ex) {
      throw ApiFailureException(ex);
    }
  }

  bool isSignedIn() {
    return user != null;
  }

  logout() {
    setUser(null);
    setToken(null);
    _hiveRepository.clear<User>(name: kUserName);
    // _hiveRepository.clear<AppModel>(name: kAppDataName);
  }

  void _setInitialData(data) {
    User user = User.fromJson(data);
    setUser(user);
    setToken(user.token);
    _hiveRepository.add<User>(name: kUserName, key: kUserName, item: user);
    _hiveRepository.add<AppModel>(
        name: kAppDataName, key: kAppDataName, item: AppModel(token: token));
  }
}
