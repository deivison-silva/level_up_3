import 'package:flutter/material.dart';
import '../../../shared/widgets/shared_widgets.dart';

class RecoverPasswordPage extends StatefulWidget {
  const RecoverPasswordPage({Key? key}) : super(key: key);

  @override
  _RecoverPasswordPageState createState() => _RecoverPasswordPageState();
}

class _RecoverPasswordPageState extends State<RecoverPasswordPage> {
  TextEditingController _newPasswordController = TextEditingController();
  TextEditingController _confirmNewPasswordController = TextEditingController();

  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  bool _newPasswordVisible = true;
  bool _confirmNewPasswordVisible = true;

  @override
  void dispose() {
    _newPasswordController.dispose();
    _confirmNewPasswordController.dispose();
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
                  'Recover Password',
                  style: TextStyle(color: Color(0xFFE50914), fontSize: 32.0),
                ),
                SizedBox(height: 8.0),
                Text(
                  'Please enter your new password and confirm the password.',
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.white, fontSize: 18.0),
                ),
                SizedBox(height: 50.0),
                InputTextWidget(
                  autofocus: true,
                  textInputAction: TextInputAction.next,
                  controller: _newPasswordController,
                  textInputType: TextInputType.text,
                  labelText: 'New Password',
                  sufixIcon: ShowPasswordWidget(
                      visible: _newPasswordVisible,
                      onPressed: () => setState(
                          () => _newPasswordVisible = !_newPasswordVisible)),
                  obscureText: _newPasswordVisible,
                  icon: Icons.vpn_key_rounded,
                ),
                SizedBox(height: 8.0),
                InputTextWidget(
                  controller: _confirmNewPasswordController,
                  textInputType: TextInputType.text,
                  labelText: 'Confirm New Password',
                  sufixIcon: ShowPasswordWidget(
                    visible: _confirmNewPasswordVisible,
                    onPressed: () => setState(() => _confirmNewPasswordVisible =
                        !_confirmNewPasswordVisible),
                  ),
                  obscureText: _confirmNewPasswordVisible,
                  icon: Icons.vpn_key_rounded,
                  validator: (value) => Validators().validateConfirmPassword(
                      value!, _newPasswordController.value.text),
                ),
                SizedBox(height: 30.0),
                ButtonTextWidget(
                  text: 'Update',
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      buildShowDialog(context);
                      Future.delayed(
                        Duration(seconds: 2),
                        () => Navigator.popAndPushNamed(context, '/login'),
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
