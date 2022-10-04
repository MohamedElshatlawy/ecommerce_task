import 'package:ecommerceapp/core/utils/app_colors.dart';
import 'package:ecommerceapp/features/screens/auth/widgets/custom_button.dart';
import 'package:ecommerceapp/features/screens/home/cubit/products_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../core/utils/app_strings.dart';

class AddSizesDialog extends StatefulWidget {
  AddSizesDialog({
    Key? key,
  }) : super(key: key);

  @override
  _AddSizesDialogState createState() => _AddSizesDialogState();
}

class _AddSizesDialogState extends State<AddSizesDialog> {
  TextEditingController size = TextEditingController();
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
                    "Add Product Sizes",
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
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Container(
                              width: 150,
                              padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
                              child: TextFormField(
                                // key: ,
                                controller: size,
                                decoration: const InputDecoration(
                                    labelText: 'Product Size',
                                    contentPadding: EdgeInsets.symmetric(
                                        vertical: 10.0, horizontal: 5),
                                    border: OutlineInputBorder()),
                              ),
                            ),
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
                            cubit.addProductSizes(size.text);
                            //     });
                            size.clear();
                            print(cubit.productSizes.length);
                            print(cubit.productSizes);
                            Navigator.of(context).pop();
                          },
                          text: 'Done'))
                ],
              ),
            ));
      },
    );
  }
}
