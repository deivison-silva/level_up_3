import 'package:flutter/material.dart';

class ShowPasswordWidget extends StatelessWidget {
  const ShowPasswordWidget({
    Key? key,
    this.visible = false,
    required this.onPressed,
  }) : super(key: key);

  final bool visible;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: onPressed,
      icon: Icon(
          visible ? Icons.visibility_off_rounded : Icons.visibility_rounded,
          color: Color(0xFFE50914)),
    );
  }
}
