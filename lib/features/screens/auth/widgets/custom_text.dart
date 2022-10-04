import 'package:flutter/material.dart';

import '../../../../core/utils/app_strings.dart';

class CustomText extends StatelessWidget {
  final String text;
  final double fontSize;
  final Color textColor;
  final Alignment alignment;
  const CustomText(
      {Key? key,
      this.text = '',
      this.fontSize = 14,
      this.textColor = Colors.black,
      this.alignment = Alignment.topLeft})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: alignment,
      child: Text(
        this.text,
        style: TextStyle(
          fontSize: this.fontSize,
          fontFamily: AppStrings.fontFamily,
          color: this.textColor,
        ),
      ),
    );
  }
}
