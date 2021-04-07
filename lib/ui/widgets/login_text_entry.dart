import 'package:flutter/material.dart';

class LoginTextEntry extends StatelessWidget {
  const LoginTextEntry({
    Key key,
    @required this.controller,
    this.backgroundColor = Colors.white,
    this.borderColor = Colors.red,
    this.obscureText = false,
    this.labelText,
    this.suffixIcon,
    this.suffixColor = Colors.red,
  }) : super(key: key);

  final TextEditingController controller;
  final Color backgroundColor;
  final Color borderColor;
  final bool obscureText;
  final String labelText;
  final IconData suffixIcon;
  final Color suffixColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(
          color: borderColor,
        ),
        color: backgroundColor,
      ),
      padding: EdgeInsets.only(left: 15),
      child: TextFormField(
        controller: controller,
        obscureText: obscureText,
        decoration: InputDecoration(
          labelText: labelText,
          border: InputBorder.none,
          suffixIcon: Icon(
            suffixIcon,
            color: suffixColor,
          ),
        ),
      ),
    );
  }
}
