import 'package:flutter/material.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:mess_dot_city/utilities/constants.dart';

class PhoneField extends StatelessWidget {
  final String initialCountry;
  final String labelText;
  final Function onChanged;
  final TextEditingController controller;
  PhoneField(
      {@required this.initialCountry,
      @required this.labelText,
      @required this.onChanged,
      this.controller});
  @override
  Widget build(BuildContext context) {
    return IntlPhoneField(
      controller: controller ?? null,
      initialCountryCode: initialCountry,
      decoration: InputDecoration(
        labelText: labelText,
        focusedBorder: kBlackOutlineBorder,
      ),
      onChanged: onChanged,
    );
  }
}
