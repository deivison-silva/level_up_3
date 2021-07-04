import 'package:flutter/material.dart';
import '../../../shared/widgets/shared_widgets.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  bool _passwordVisible = true;

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black, //Color(0xFFE50914)
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: SingleChildScrollView(
          child: Container(
            height: MediaQuery.of(context).size.height,
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextLogoWidget(),
                  SizedBox(height: 16.0),
                  InputTextWidget(
                    controller: _emailController,
                    textInputAction: TextInputAction.next,
                    autofocus: true,
                    icon: Icons.email,
                    labelText: 'Email',
                    textInputType: TextInputType.emailAddress,
                    validator: (value) => Validators().validateEmail(value!),
                  ),
                  SizedBox(height: 8.0),
                  InputTextWidget(
                    controller: _passwordController,
                    icon: Icons.vpn_key_rounded,
                    sufixIcon: ShowPasswordWidget(
                        visible: _passwordVisible,
                        onPressed: () => setState(
                            () => _passwordVisible = !_passwordVisible)),
                    labelText: 'Password',
                    obscureText: _passwordVisible,
                    textInputType: TextInputType.text,
                    validator: (value) => Validators().validatePassword(value!),
                  ),
                  ForgotPasswordButton(),
                  ButtonTextWidget(
                    text: 'Login',
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        if (_emailController.value.text == 'teste@gmail.com' &&
                            _passwordController.value.text == 'Teste1#1') {
                          Navigator.popAndPushNamed(context, '/home');
                        }
                      }
                    },
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('Don\'t have an account?',
                          style: TextStyle(color: Colors.white)),
                      TextButton(
                        child: Text('Register'),
                        onPressed: () =>
                            Navigator.pushNamed(context, '/register'),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
