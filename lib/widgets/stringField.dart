import 'package:flutter/material.dart';
import 'package:mess_dot_city/utilities/constants.dart';

class StringField extends StatelessWidget {
  final String labelText;
  final Function onChanged;
  final Icon icon;
  final TextEditingController controller;
  StringField({this.labelText, this.onChanged, this.icon, this.controller});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller ?? null,
      validator: (value) {
        if (value.isEmpty) {
          return 'Please enter phone number';
        }
        return null;
      },
      onChanged: onChanged ?? (value) {},
      decoration: InputDecoration(
        labelText: labelText ?? '',
        focusedBorder: kBlackOutlineBorder,
        prefixIcon: icon ??
            const Icon(
              Icons.check,
            ),
      ),
    );
  }
}
