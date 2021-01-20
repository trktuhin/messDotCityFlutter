import 'package:flutter/material.dart';
import 'package:mess_dot_city/screens/loginScreen.dart';
import 'package:mess_dot_city/screens/registrationScreen.dart';

const SERVER_IP = 'http://10.0.2.2:5000/api/';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Mess.City',
      theme: ThemeData(
        // Define the default brightness and colors.
        brightness: Brightness.light,
        primaryColor: Colors.lightBlue[800],
        accentColor: Colors.cyan[600],

        // Define the default font family.
        fontFamily: 'Georgia',

        // Define the default TextTheme. Use this to specify the default
        // text styling for headlines, titles, bodies of text, and more.
        textTheme: TextTheme(
          headline1: TextStyle(fontSize: 72.0, fontWeight: FontWeight.bold),
          headline6: TextStyle(fontSize: 36.0, fontStyle: FontStyle.italic),
          bodyText2: TextStyle(fontSize: 14.0, fontFamily: 'Hind'),
        ),
      ),
      initialRoute: LoginScreen.screenId,
      routes: {
        LoginScreen.screenId: (context) => LoginScreen(),
        RegistrationScreen.screenId: (context) => RegistrationScreen(),
      },
    );
  }
}
