import 'package:flutter/material.dart';

Widget buttonMainAction({
  required BuildContext context,
  required String text,
  required Function() ? onPressed,
}) {
  return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: 60,
      child: TextButton(
        onPressed: onPressed,
        style: ButtonStyle(
          overlayColor: MaterialStateColor.resolveWith((states) => Colors.transparent),
          backgroundColor: MaterialStateProperty.resolveWith((states) => const Color(0xFFFFFFFF)),
          foregroundColor: MaterialStateProperty.resolveWith((states) => const Color(0xFF2659F1)),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
              side: const BorderSide(
                color: Color(0xFF2659F1),
                width: 1.0,
              ),
            )
          )
        ),
        child: Text(
          text,
          style: const TextStyle(
            fontFamily: 'KanitRegular',
            fontSize: 20,
            height: 1.4,
          ),
        ),
      )
  );
}