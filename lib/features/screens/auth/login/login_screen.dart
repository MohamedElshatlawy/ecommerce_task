import 'package:ecommerceapp/core/utils/app_colors.dart';
import 'package:ecommerceapp/core/utils/app_strings.dart';
import 'package:ecommerceapp/features/screens/auth/cubit/auth_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../config/routes/app_routes.dart';
import '../widgets/custom_TextFormField.dart';
import '../widgets/custom_button.dart';
import '../widgets/custom_text.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({Key? key}) : super(key: key);
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.white,
      ),
      body: BlocConsumer<AuthCubit, AuthState>(
        listener: (context, state) {
          // TODO: implement listener
        },
        builder: (context, state) {
          return SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.only(right: 20, left: 20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 100.h,
                  ),
                  Form(
                    key: _formKey,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const CustomText(
                              text: AppStrings.welcomeTitle,
                              fontSize: 24,
                            ),
                            TextButton(
                                onPressed: () {
                                  Navigator.pushNamed(
                                      context, Routes.registerScreen);
                                },
                                child: CustomText(
                                  text: AppStrings.signUp,
                                  fontSize: 18,
                                  textColor: AppColors.primeryColor,
                                ))
                          ],
                        ),
                        const CustomText(
                          text: AppStrings.signInToContinue,
                          textColor: Color.fromRGBO(146, 146, 146, 1),
                        ),
                        SizedBox(
                          height: 50.h,
                        ),
                        CustomtextFormField(
                          controller: _emailController,
                          hintText: 'Email',
                          keyBoardType: TextInputType.emailAddress,
                          lableText: 'Email',
                          onSaved: (String value) {
                            _emailController.text = value;
                          },
                          validate: (String value) {
                            if (value.isEmpty) {
                              return 'please, enter email.';
                            } else {
                              return '';
                            }
                          },
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        CustomtextFormField(
                          controller: _passwordController,
                          hintText: '******',
                          keyBoardType: TextInputType.visiblePassword,
                          lableText: 'password',
                          ispassword: true,
                          onSaved: (String value) {
                            _passwordController.text = value;
                          },
                          validate: (String value) {
                            if (value.isEmpty) {
                              return 'please, enter password.';
                            } else {
                              return '';
                            }
                          },
                        ),
                        Row(
                          children: [
                            Expanded(child: Container()),
                            TextButton(
                              onPressed: () {},
                              child: const CustomText(
                                text: AppStrings.forgetPassword,
                                alignment: Alignment.topRight,
                              ),
                            ),
                          ],
                        ),
                        state is Logging
                            ? const Center(
                                child: CircularProgressIndicator(
                                  color: Colors.purple,
                                ),
                              )
                            : CustomButton(
                                btnColor: AppColors.primeryColor,
                                text: 'sing in',
                                onPressed: () {
                                  _formKey.currentState!.save();
                                  if (_formKey.currentState!.validate()) {
                                    AuthCubit.get(context).login(context,
                                        email: _emailController.text,
                                        password: _passwordController.text);
                                  }
                                },
                              ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
