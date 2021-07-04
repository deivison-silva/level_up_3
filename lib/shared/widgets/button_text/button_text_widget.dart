import 'package:flutter/material.dart';

class ButtonTextWidget extends StatelessWidget {
  const ButtonTextWidget({
    Key? key,
    required this.text,
    this.onPressed,
  }) : super(key: key);

  final String text;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: BoxConstraints.tightFor(
        width: double.maxFinite,
        height: 45.0,
      ),
      child: ElevatedButton(
        onPressed: onPressed,
        child: Text(text, style: TextStyle(fontSize: 16.0)),
        style: ElevatedButton.styleFrom(
          primary: Color(0xFFE50914),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(8.0)),
          ),
        ),
      ),
    );
  }
}
