import 'package:flutter/material.dart';
import 'package:mess_dot_city/screens/loginScreen.dart';
import 'package:mess_dot_city/screens/registrationScreen.dart';

class UnregisteredDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.zero,
      children: <Widget>[
        DrawerHeader(
          child: Text('Header'),
          decoration: BoxDecoration(
            color: Colors.blue,
          ),
        ),
        ListTile(
          title: Text('Registraion'),
          onTap: () {
            // Update the state of the app
            // ...
            // Then close the drawer
            Navigator.pop(context);
            Navigator.pushNamedAndRemoveUntil(
                context, RegistrationScreen.screenId, (route) => false);
          },
        ),
        ListTile(
          title: Text('Login'),
          onTap: () {
            // Update the state of the app
            // ...
            // Then close the drawer
            Navigator.pop(context);
            Navigator.pushNamedAndRemoveUntil(
                context, LoginScreen.screenId, (route) => false);
          },
        ),
      ],
    );
  }
}
