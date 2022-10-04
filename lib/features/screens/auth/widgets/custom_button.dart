import 'package:flutter/material.dart';

import 'custom_text.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final Color textColor;
  final Color btnColor;
  final Function() onPressed;
  CustomButton(
      {Key? key,
      this.textColor = Colors.white,
      required this.btnColor,
      required this.onPressed,
      required this.text})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      padding: const EdgeInsets.all(15),
      color: btnColor,
      onPressed: onPressed,
      child: CustomText(
        text: text.toUpperCase(),
        alignment: Alignment.center,
        textColor: textColor,
      ),
    );
  }
}
