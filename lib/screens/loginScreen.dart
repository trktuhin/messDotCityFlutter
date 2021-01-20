import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:mess_dot_city/models/loginModel.dart';
import 'package:mess_dot_city/screens/registrationScreen.dart';
import 'package:mess_dot_city/services/authenticationService.dart';
import 'package:mess_dot_city/utilities/constants.dart';
import 'package:mess_dot_city/widgets/passwordField.dart';
import 'package:mess_dot_city/widgets/phoneField.dart';
import 'package:mess_dot_city/widgets/submitButton.dart';
import 'package:mess_dot_city/widgets/unregisteredDrawer.dart';
import 'package:http/http.dart' as http;

class LoginScreen extends StatefulWidget {
  static const String screenId = 'loginScreenId';
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  AuthenticationService authService = AuthenticationService();
  String mobile;
  TextEditingController mobileController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  login() async {
    String url = 'http://10.0.2.2:5000/api/auth/login';
    LoginModel model = LoginModel(mobile, passwordController.text);
    http.Response response = await authService.attemptLogin(model);
    if (response.statusCode == 200) {
      print(response.body);
    }
    print(response.body);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Login',
          style: kAppbarTextStyle,
        ),
        backgroundColor: Colors.black,
      ),
      drawer: Drawer(
        child: UnregisteredDrawer(),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                SizedBox(
                  height: 10.0,
                ),
                Hero(
                  tag: 'logo',
                  child: Container(
                    height: 200.0,
                    child: Image.asset('assets/images/logo.png'),
                  ),
                ),
                PhoneField(
                  controller: mobileController,
                  initialCountry: 'BD',
                  labelText: 'Mobile number',
                  onChanged: (phone) {
                    setState(() {
                      mobile = phone.completeNumber;
                    });
                  },
                ),
                SizedBox(
                  height: 10,
                ),
                PasswordField(
                  controller: passwordController,
                  labelText: 'Password',
                  onChanged: (value) {},
                ),
                SizedBox(
                  height: 10,
                ),
                SubmitButton(
                  btnText: 'Login',
                  onPressed: () {
                    // print('login pressed');
                    if (_formKey.currentState.validate()) {
                      login();
                    }
                  },
                ),
                SizedBox(
                  height: 10,
                ),
                FlatButton(
                  onPressed: () {
                    Navigator.pushNamedAndRemoveUntil(
                        context, RegistrationScreen.screenId, (route) => false);
                  },
                  child: Text('Don\'t have account? Create here'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
