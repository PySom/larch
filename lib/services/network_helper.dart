import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:lagosarchdiocese/Exceptions/api_failure_exception.dart';
import 'package:lagosarchdiocese/models/login_model.dart';
import 'package:lagosarchdiocese/models/register_model.dart';
import 'package:lagosarchdiocese/utils/constants.dart';

/// Helper class to make http request

class NetworkHelper {
  Future<dynamic> loginUser(String email, String password) async {
    var body = Login(email: email, password: password).toJson();
    return await authRequest(body, '$kAppAPIUrl/account/login');
  }

  Future<dynamic> registerUser(
      String name, String email, String password) async {
    print('$email, $name, $password');
    List<String> split = _splitName(name);
    String firstName = split.first;
    String lastName = split.last;
    var body = Register(
      firstName: firstName,
      lastName: lastName,
      email: email,
      password: password,
    ).toJson();
    return await authRequest(body, '$kAppAPIUrl/account/register');
  }

  Future<dynamic> authRequest(Map body, String url) async {
    print('body is $body');
    var response =
        await http.post(url, headers: kHeaders(null), body: json.encode(body));
    print(response.body);
    var decoded = jsonDecode(response.body);
    if (response.statusCode.toString().startsWith('2')) {
      print(decoded);
      return decoded;
    } else {
      print(
          'reason is ${response.reasonPhrase} message is ${decoded['message']}');
      throw ApiFailureException(decoded['message'] ?? response.reasonPhrase);
    }
  }

  Future<dynamic> getRequest(String url) async {
    var response = await http.get(url, headers: kHeaders(null));
    print(response.body);
    var decoded = jsonDecode(response.body);
    if (response.statusCode.toString().startsWith('2')) {
      print(decoded);
      return decoded;
    } else {
      print(
          'reason is ${response.reasonPhrase} message is ${decoded['message']}');
      throw ApiFailureException(decoded['message'] ?? response.reasonPhrase);
    }
  }

  List<String> _splitName(String name) {
    if (name == null) {
      return ['', ''];
    }
    List<String> splitted = name.split(',');
    if (splitted.length == 1) {
      return [splitted[0], ''];
    }
    return splitted.sublist(0, 2);
  }
}
