import 'package:ecommerceapp/features/screens/auth/widgets/custom_text.dart';
import 'package:flutter/material.dart';

import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_strings.dart';

class CustomtextFormField extends StatelessWidget {
  final String lableText;
  final String hintText;
  Function(String?)? onSaved;
  //String validate(String val) {}
  String? Function(String?)? validate;
  final TextInputType keyBoardType;
  final bool ispassword;
  TextEditingController controller;
  CustomtextFormField(
      {Key? key,
      this.lableText = '',
      this.hintText = '',
      onSaved,
      validate,
      this.keyBoardType = TextInputType.text,
      required this.controller,
      this.ispassword = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomText(
          text: lableText,
          fontSize: 14,
          textColor: Colors.grey.shade900,
        ),
        const SizedBox(
          height: 10,
        ),
        TextFormField(
          controller: controller,
          keyboardType: keyBoardType,
          onSaved: onSaved,
          validator: validate,
          obscureText: ispassword,
          cursorColor: AppColors.primeryColor,
          decoration: InputDecoration(
            focusedBorder: OutlineInputBorder(
              borderSide:
                  const BorderSide(color: Colors.greenAccent, width: 1.0),
              borderRadius: BorderRadius.circular(10.0),
            ),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: AppColors.primeryColor, width: 1.0),
              borderRadius: BorderRadius.circular(10.0),
            ),
            errorBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: Colors.red, width: 1.0),
              borderRadius: BorderRadius.circular(10.0),
            ),

            // enabledBorder: UnderlineInputBorder(
            //     borderSide: BorderSide(color: primaryColor)),
            focusColor: AppColors.primeryColor,
            hintText: hintText,
            hintStyle: const TextStyle(
                color: Colors.grey, fontFamily: AppStrings.fontFamily),
            fillColor: Colors.white,
          ),
        ),
      ],
    );
  }
}
