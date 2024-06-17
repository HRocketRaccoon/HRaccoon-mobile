import 'package:flutter/material.dart';

import 'package:hraccoon/widget/buttonMainAction.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFFFFF),
      body: Center(
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.fromLTRB(28, 0, 28, 0),
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
                _textField("Email", TextEditingController(), false),
                _textField("Password", TextEditingController(), true),
                const Spacer(flex: 1),
                buttonMainAction(context: context, text: "Enter", onPressed: null),
                const Spacer(flex: 3),
              ],
            ),
          )
        )
      )
    );
  }
}

Widget _textField(String hintText, TextEditingController controller, bool obscureText) {
  return Container(
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
          )
        ),
        focusedBorder: const UnderlineInputBorder(
          borderSide: BorderSide(
            color: Color(0xFF92ACF8),
          )
        ),
        focusColor: const Color(0xFF92ACF8),
      ),
      style: const TextStyle(
        fontFamily: "KanitRegular",
        fontSize: 16.0,
        color: Color(0xFF000000),
      )
    )
  );
}