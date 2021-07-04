import 'package:flutter/material.dart';

class InputTextWidget extends StatelessWidget {
  const InputTextWidget({
    Key? key,
    this.controller,
    this.obscureText = false,
    this.autofocus = false,
    required this.textInputType,
    this.textInputAction,
    required this.labelText,
    required this.icon,
    this.sufixIcon,
    this.validator,
  }) : super(key: key);

  final TextEditingController? controller;
  final bool obscureText;
  final bool autofocus;
  final TextInputType textInputType;
  final TextInputAction? textInputAction;
  final String labelText;
  final IconData icon;
  final Widget? sufixIcon;
  final String? Function(String? value)? validator;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      autofocus: autofocus,
      controller: controller,
      autocorrect: true,
      obscureText: obscureText,
      keyboardType: textInputType,
      textInputAction: textInputAction,
      decoration: InputDecoration(
        labelText: labelText,
        labelStyle: TextStyle(color: Colors.white),
        prefixIcon: Icon(icon, color: Color(0xFFE50914)),
        suffixIcon: sufixIcon,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(8.0)),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Color(0xFFE50914)),
          borderRadius: BorderRadius.all(Radius.circular(8.0)),
        ),
        errorStyle: TextStyle(color: Colors.white),
      ),
      style: TextStyle(color: Colors.white),
      validator: validator,
    );
  }
}
