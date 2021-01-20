import 'package:flutter/material.dart';
import 'package:mess_dot_city/utilities/constants.dart';

class PasswordField extends StatelessWidget {
  final String labelText;
  final Function onChanged;
  final TextEditingController passwordController;
  final TextEditingController controller;

  PasswordField(
      {this.labelText,
      this.onChanged,
      this.passwordController,
      this.controller});
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      validator: (value) {
        if (value.isEmpty) {
          return 'Please enter phone number';
        }
        if (value.length < 5) {
          return 'Enter minimum 5 characters';
        }
        if (value.length > 12) {
          return 'Don\'t use than 12 characters';
        }
        if (passwordController != null && controller != null) {
          if (passwordController.text != controller.text) {
            return 'Password doesn\'t match';
          }
        }
        return null;
      },
      onChanged: onChanged ?? (value) {},
      obscureText: true,
      decoration: InputDecoration(
        labelText: labelText ?? '',
        focusedBorder: kBlackOutlineBorder,
        prefixIcon: const Icon(
          Icons.lock,
        ),
      ),
    );
  }
}
