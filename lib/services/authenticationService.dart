import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:mess_dot_city/models/loginModel.dart';
import '../main.dart';

class AuthenticationService {
  attemptLogin(LoginModel model) {
    String url = SERVER_IP + 'auth/login';
    return http.post(url,
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(<String, String>{
          "mobile": model.mobile,
          "password": model.password,
        }));
  }
}
