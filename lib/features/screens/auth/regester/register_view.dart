import 'package:ecommerceapp/core/utils/app_colors.dart';
import 'package:ecommerceapp/core/utils/app_strings.dart';
import 'package:ecommerceapp/features/screens/auth/cubit/auth_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../widgets/custom_TextFormField.dart';
import '../widgets/custom_button.dart';
import '../widgets/custom_text.dart';

class RegisterScreen extends StatelessWidget {
  RegisterScreen({Key? key}) : super(key: key);
  final TextEditingController _fullNameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.white,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back_ios,
            color: Colors.black,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(right: 20, left: 20),
          child: Column(
            children: [
              SizedBox(
                height: 100.h,
              ),
              BlocConsumer<AuthCubit, AuthState>(
                listener: (context, state) {
                  // TODO: implement listener
                },
                builder: (context, state) {
                  return Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        const CustomText(
                          text: '${AppStrings.signUp},',
                          fontSize: 30,
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        CustomtextFormField(
                          controller: _fullNameController,
                          hintText: 'Full Name',
                          keyBoardType: TextInputType.emailAddress,
                          lableText: 'Name',
                          onSaved: (String value) {
                            _fullNameController.text = value;
                          },
                          validate: (String value) {
                            if (value.isEmpty) {
                              return 'please, enter name.';
                            } else {
                              return '';
                            }
                          },
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        CustomtextFormField(
                          controller: _emailController,
                          hintText: 'example@example.com',
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
                          hintText: '*******',
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
                        const SizedBox(
                          height: 20,
                        ),
                        CustomButton(
                          btnColor: AppColors.primeryColor,
                          text: 'sing Up',
                          onPressed: () {
                            _formKey.currentState!.save();
                            if (_formKey.currentState!.validate()) {
                              AuthCubit.get(context).register(context,
                                  email: _emailController.text,
                                  password: _passwordController.text,
                                  fullName: _fullNameController.text);
                            }
                          },
                        ),
                      ],
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
