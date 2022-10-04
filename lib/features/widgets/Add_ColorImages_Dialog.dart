import 'package:ecommerceapp/core/utils/app_colors.dart';
import 'package:ecommerceapp/features/screens/auth/widgets/custom_button.dart';
import 'package:ecommerceapp/features/screens/home/cubit/products_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../core/utils/app_strings.dart';

class CustomAlertDialog extends StatefulWidget {
  CustomAlertDialog({
    Key? key,
  }) : super(key: key);

  @override
  _CustomAlertDialogState createState() => _CustomAlertDialogState();
}

class _CustomAlertDialogState extends State<CustomAlertDialog> {
  TextEditingController colorName = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ProductsCubit, ProductsState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        var cubit = ProductsCubit.get(context);
        return Dialog(
            elevation: 0,
            backgroundColor: const Color(0xffffffff),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
            child: SizedBox(
              height: 250,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const SizedBox(
                    height: 20,
                  ),
                  const Text(
                    "Add Product Colors",
                    style: TextStyle(
                        fontFamily: AppStrings.fontFamily, fontSize: 16),
                  ),
                  const SizedBox(height: 20),
                  const Divider(
                    height: 1.5,
                  ),
                  const SizedBox(height: 30),
                  Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Container(
                        //      margin: new EdgeInsets.all(8.0),
                        child: ListBody(
                          children: <Widget>[
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Container(
                                  width: 150,
                                  padding:
                                      const EdgeInsets.fromLTRB(10, 0, 0, 0),
                                  child: TextFormField(
                                    // key: ,
                                    controller: colorName,
                                    decoration: const InputDecoration(
                                        labelText: 'Color Name',
                                        contentPadding: EdgeInsets.symmetric(
                                            vertical: 10.0, horizontal: 5),
                                        border: OutlineInputBorder()),
                                  ),
                                ),
                                Container(
                                  width: 100,
                                  padding:
                                      const EdgeInsets.fromLTRB(5, 0, 0, 0),
                                  child: cubit.isFileChoosed
                                      ? Image(
                                          image: FileImage(cubit.file),
                                          height: 50,
                                          width: 50,
                                        )
                                      : Container(
                                          height: 50,
                                          width: 50,
                                          decoration: BoxDecoration(
                                              color: Colors.white,
                                              border: Border(
                                                  bottom: BorderSide(
                                                      width: 1,
                                                      color: AppColors
                                                          .primeryColor),
                                                  left: BorderSide(
                                                      width: 1,
                                                      color: AppColors
                                                          .primeryColor),
                                                  right: BorderSide(
                                                      width: 1,
                                                      color: AppColors
                                                          .primeryColor),
                                                  top: BorderSide(
                                                      width: 1,
                                                      color: AppColors
                                                          .primeryColor)),
                                              borderRadius:
                                                  BorderRadius.circular(5)),
                                          child: TextButton(
                                            onPressed: (() {
                                              setState(() {
                                                cubit.isFileChoosed = false;
                                              });
                                              cubit.choosePhoto();
                                            }),
                                            child: const Text(
                                              "Image",
                                              style: TextStyle(
                                                fontFamily:
                                                    AppStrings.fontFamily,
                                                fontSize: 14,
                                              ),
                                            ),
                                          ),
                                        ),
                                ),
                              ],
                            )
                          ],
                        ),
                      )),
                  const SizedBox(
                    height: 50,
                  ),
                  SizedBox(
                      width: 150,
                      child: CustomButton(
                          btnColor: AppColors.primeryColor,
                          onPressed: () {
                            cubit.addColorandImageName(
                                colorName.text, cubit.file);
                            print(cubit.colorImageList.length);
                            cubit.removeImageFile();
                            Navigator.pop(context);
                          },
                          text: 'Done'))
                ],
              ),
            ));
      },
    );
  }
}
