import 'package:flutter/material.dart';
import '../../../shared/widgets/shared_widgets.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Future.delayed(Duration(seconds: 5),
        () => Navigator.pushReplacementNamed(context, '/login'));
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextLogoWidget(),
            SizedBox(height: 16.0),
            CircularProgressIndicator(color: Color(0xFFE50914))
          ],
        ),
      ),
    );
  }
}
