import 'package:flutter/material.dart';
import '../../../shared/widgets/shared_widgets.dart';

class ForgotPasswordPage extends StatefulWidget {
  const ForgotPasswordPage({Key? key}) : super(key: key);

  @override
  _ForgotPasswordPageState createState() => _ForgotPasswordPageState();
}

class _ForgotPasswordPageState extends State<ForgotPasswordPage> {
  TextEditingController _emailController = TextEditingController();

  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    _emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 24.0),
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  'Forgot your Password?',
                  style: TextStyle(color: Color(0xFFE50914), fontSize: 32.0),
                ),
                SizedBox(height: 8.0),
                Text(
                  'please enter your cineflix registered email for us to check the database and recover your password.',
                  style: TextStyle(color: Colors.white, fontSize: 18.0),
                ),
                SizedBox(height: 50.0),
                InputTextWidget(
                  autofocus: true,
                  controller: _emailController,
                  textInputType: TextInputType.emailAddress,
                  labelText: 'Email',
                  icon: Icons.email,
                  validator: (value) => Validators().validateEmail(value!),
                ),
                SizedBox(height: 30.0),
                ButtonTextWidget(
                  text: 'Recover Password',
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      buildShowDialog(context);
                      Future.delayed(
                        Duration(seconds: 2),
                        () => Navigator.pushReplacementNamed(
                            context, '/recover_password'),
                      );
                    }
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  buildShowDialog(context) {
    return showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) {
        return Center(
          child: CircularProgressIndicator(),
        );
      },
    );
  }
}
