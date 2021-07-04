import 'package:flutter/material.dart';

class ForgotPasswordButton extends StatelessWidget {
  const ForgotPasswordButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomRight,
      child: TextButton(
        child: Text('Forgot your password?'),
        onPressed: () {
          Navigator.pushNamed(context, '/forgot_password');
        },
      ),
    );
  }
}
