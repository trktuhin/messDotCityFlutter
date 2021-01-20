import 'package:flutter/material.dart';

class SubmitButton extends StatelessWidget {
  final String btnText;
  final Function onPressed;
  SubmitButton({this.btnText, this.onPressed});
  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      color: Colors.black,
      child: Container(
        height: 50.0,
        child: Center(
          child: Text(
            btnText ?? 'Submit',
            style: TextStyle(
              color: Colors.white,
              fontSize: 18.0,
            ),
          ),
        ),
      ),
      onPressed: onPressed ?? () {},
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(18.0),
          side: BorderSide(color: Colors.black)),
    );
  }
}
