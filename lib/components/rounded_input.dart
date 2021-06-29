import 'package:areclambord_client_new/components/constants.dart';
import 'package:flutter/material.dart';

import 'input_container.dart';

class RoundedInput extends StatelessWidget {
  const RoundedInput({
    Key key,
    @required this.icon,
    @required this.hint,
    @required this.obscureText,
    @required this.controller
  }) : super(key: key);

  final IconData icon;
  final String hint;
  final bool obscureText;
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return InputContainer(
      child: TextField(
        controller: controller,
        obscureText: obscureText,
        cursorColor: kPrimaryColor,
        decoration: InputDecoration(
          icon: Icon(icon, color: kPrimaryColor),
          hintText: hint,
          border: InputBorder.none
        ),
      ),);
  }
}

