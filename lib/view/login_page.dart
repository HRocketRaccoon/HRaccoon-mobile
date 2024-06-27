import 'package:flutter/material.dart';

import 'package:hraccoon/widget/button_main_action.dart';
import 'package:hraccoon/config/route_name.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key});

  final List<String> employNum = ['A000004', 'A000005', 'A000006', 'test'];
  final List<String> password = ['A1b!2c3d', 'P@ssw0rd', 'Qw3\$rty4', 'test'];

  @override
  Widget build(BuildContext context) {
    final TextEditingController emailController = TextEditingController();
    final TextEditingController passwordController = TextEditingController();

    void _login() {
      final String email = emailController.text;
      final String pass = passwordController.text;

      bool loginSuccess = false;
      for (int i = 0; i < employNum.length; i++) {
        if (email == employNum[i] && pass == password[i]) {
          loginSuccess = true;
          break;
        }
      }

      if (loginSuccess) {
        Navigator.pushNamed(context, RouteName.home);
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('로그인에 실패했습니다'),
            duration: Duration(seconds: 2),
          ),
        );
      }
    }

    return Scaffold(
      backgroundColor: const Color(0xFFFFFFFF),
      body: Center(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(28, 0, 28, 0),
            child: Column(
              children: <Widget>[
                const Spacer(flex: 3),
                Image.asset(
                  'assets/logo/Logo-Color.png',
                  width: 240,
                ),
                const Spacer(flex: 1),
                const Text(
                  "HRaccoon",
                  style: TextStyle(
                    fontFamily: 'KanitRegular',
                    fontSize: 32,
                  ),
                ),
                const Spacer(flex: 1),
                _textField("Enter E-mail", emailController, false),
                _textField("********", passwordController, true),
                const Spacer(flex: 1),
                buttonMainAction(
                  context: context,
                  text: "Enter",
                  onPressed: _login,
                ),
                const Spacer(flex: 3),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _textField(String hintText, TextEditingController controller, bool obscureText) {
    return SizedBox(
      height: 52,
      child: TextField(
        controller: controller,
        obscureText: obscureText,
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle: const TextStyle(
            color: Color(0xFFB8B8B8),
            fontFamily: "KanitRegular",
            fontSize: 16.0,
          ),
          enabledBorder: const UnderlineInputBorder(
            borderSide: BorderSide(
              color: Color(0xFFB8B8B8),
            ),
          ),
          focusedBorder: const UnderlineInputBorder(
            borderSide: BorderSide(
              color: Color(0xFF92ACF8),
            ),
          ),
          focusColor: const Color(0xFF92ACF8),
        ),
        style: const TextStyle(
          fontFamily: "KanitRegular",
          fontSize: 16.0,
          color: Color(0xFF000000),
        ),
      ),
    );
  }
}