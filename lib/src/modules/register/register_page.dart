import 'package:flutter/material.dart';
import '../../../shared/widgets/shared_widgets.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  TextEditingController _fullNameController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  TextEditingController _confirmPasswordController = TextEditingController();

  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  bool _passwordVisible = true;
  bool _confirmPasswordVisible = true;

  @override
  void dispose() {
    _fullNameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
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
              children: [
                Text(
                  'Register to CINEFLIX',
                  style: TextStyle(color: Colors.white, fontSize: 32.0),
                ),
                SizedBox(height: 30.0),
                InputTextWidget(
                  controller: _fullNameController,
                  autofocus: true,
                  textInputAction: TextInputAction.next,
                  icon: Icons.person,
                  labelText: 'Full Name',
                  textInputType: TextInputType.text,
                  validator: (value) => Validators().validateName(value!),
                ),
                SizedBox(height: 8.0),
                InputTextWidget(
                  controller: _emailController,
                  textInputAction: TextInputAction.next,
                  icon: Icons.email,
                  labelText: 'Email',
                  textInputType: TextInputType.emailAddress,
                  validator: (value) => Validators().validateEmail(value!),
                ),
                SizedBox(height: 8.0),
                InputTextWidget(
                  controller: _passwordController,
                  icon: Icons.vpn_key_rounded,
                  textInputAction: TextInputAction.next,
                  sufixIcon: ShowPasswordWidget(
                      visible: _passwordVisible,
                      onPressed: () =>
                          setState(() => _passwordVisible = !_passwordVisible)),
                  labelText: 'Password',
                  obscureText: _passwordVisible,
                  textInputType: TextInputType.text,
                ),
                SizedBox(height: 8.0),
                InputTextWidget(
                  controller: _confirmPasswordController,
                  icon: Icons.vpn_key_rounded,
                  sufixIcon: ShowPasswordWidget(
                      visible: _confirmPasswordVisible,
                      onPressed: () => setState(() =>
                          _confirmPasswordVisible = !_confirmPasswordVisible)),
                  labelText: 'Confirm Password',
                  obscureText: _confirmPasswordVisible,
                  textInputType: TextInputType.text,
                  validator: (value) => Validators().validateConfirmPassword(
                      value!, _passwordController.value.text),
                ),
                SizedBox(height: 30.0),
                ButtonTextWidget(
                  text: 'Register',
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      Navigator.pop(context);
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
}
