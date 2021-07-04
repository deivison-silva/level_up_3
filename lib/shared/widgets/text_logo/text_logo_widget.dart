import 'package:flutter/material.dart';
import '../shared_widgets.dart';

class TextLogoWidget extends StatelessWidget {
  const TextLogoWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      'CINEFLIX',
      style: GoogleFonts.bebasNeue(
        textStyle: TextStyle(
          color: Color(0xFFE50914),
          fontSize: 56.0,
          letterSpacing: 4.0,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}
