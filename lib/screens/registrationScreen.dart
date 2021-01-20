import 'package:flutter/material.dart';
import 'package:mess_dot_city/utilities/constants.dart';
import 'package:mess_dot_city/widgets/passwordField.dart';
import 'package:mess_dot_city/widgets/phoneField.dart';
import 'package:mess_dot_city/widgets/stringField.dart';
import 'package:mess_dot_city/widgets/submitButton.dart';
import 'package:mess_dot_city/widgets/unregisteredDrawer.dart';

import 'loginScreen.dart';

class RegistrationScreen extends StatefulWidget {
  static const String screenId = 'registrationScreenId';

  @override
  _RegistrationScreenState createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  String mobile;
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController mobileController = TextEditingController();
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Registration',
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
                Hero(
                  tag: 'logo',
                  child: Container(
                    height: 100.0,
                    child: Image.asset('assets/images/logo.png'),
                  ),
                ),
                StringField(
                  controller: firstNameController,
                  labelText: 'First Name',
                ),
                SizedBox(
                  height: 10.0,
                ),
                StringField(
                  controller: lastNameController,
                  labelText: 'Last Name',
                ),
                SizedBox(
                  height: 10.0,
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
                PasswordField(
                  passwordController: passwordController,
                  controller: confirmPasswordController,
                  labelText: 'Confirm Password',
                  onChanged: (value) {},
                ),
                SizedBox(
                  height: 10,
                ),
                SubmitButton(
                  btnText: 'Register',
                  onPressed: () {
                    if (_formKey.currentState.validate()) {
                      print(mobileController.text);
                    }
                  },
                ),
                SizedBox(
                  height: 10,
                ),
                FlatButton(
                  onPressed: () {
                    Navigator.pushNamedAndRemoveUntil(
                        context, LoginScreen.screenId, (route) => false);
                  },
                  child: Text('Already have account? Login here'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
