import 'package:ecommerceapp/core/utils/app_colors.dart';
import 'package:ecommerceapp/features/screens/auth/widgets/custom_button.dart';
import 'package:ecommerceapp/features/screens/home/cubit/products_cubit.dart';
import 'package:ecommerceapp/features/widgets/variation_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../core/utils/app_strings.dart';

class AddVariationsDialog extends StatefulWidget {
  AddVariationsDialog({
    Key? key,
  }) : super(key: key);

  @override
  _AddVariationsDialogState createState() => _AddVariationsDialogState();
}

class _AddVariationsDialogState extends State<AddVariationsDialog> {
  // TextEditingController productPrice = TextEditingController();
  // TextEditingController productSize = TextEditingController();
  // TextEditingController productColor = TextEditingController();
  // // List<Map<String, dynamic>> itemsRowData = [];
  // List<TextEditingController> controllers = [];

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
            backgroundColor: Color(0xffffffff),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
            child: Container(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const SizedBox(
                    height: 20,
                  ),
                  const Text(
                    "Add Product variations",
                    style: TextStyle(
                        fontFamily: AppStrings.fontFamily, fontSize: 16),
                  ),
                  const SizedBox(height: 20),
                  const Divider(
                    height: 1.5,
                  ),
                  const SizedBox(height: 30),
                  cubit.productSizes.isNotEmpty &&
                          cubit.colorImageList.isNotEmpty
                      ? Expanded(
                          child: ListView.separated(
                              itemBuilder: ((context, index) {
                                return Row(
                                  children: [
                                    TextFormViration(
                                      lable: "Color",
                                      isReadOnly: true,
                                      value:
                                          cubit.allVariationsList[index].color,
                                    ),
                                    TextFormViration(
                                      lable: "Size",
                                      isReadOnly: true,
                                      value:
                                          cubit.allVariationsList[index].size,
                                    ),
                                    TextFormViration(
                                      isReadOnly: false,
                                      lable: "Price",
                                      value: cubit
                                          .allVariationsList[index].price
                                          .toString(),
                                      onChanged: (value) {
                                        cubit.allVariationsList[index].price =
                                            double.parse(value);
                                      },
                                    ),
                                  ],
                                );
                              }),
                              separatorBuilder: (context, index) =>
                                  const SizedBox(
                                    height: 10,
                                  ),
                              itemCount: (cubit.allVariationsList.length)),
                        )
                      : const Center(
                          child: Text(
                            "add Image And size first",
                            style: TextStyle(
                                color: Colors.red,
                                fontSize: 14,
                                fontFamily: AppStrings.fontFamily),
                          ),
                        ),
                  const SizedBox(
                    height: 30,
                  ),
                  Container(
                      width: 150,
                      child: CustomButton(
                          btnColor: AppColors.primeryColor,
                          onPressed: () {
                            //size.text = '';
                            // setState(() {
                            //   cubit.addProductvariations(size.text);
                            // });
                            // print(cubit.productvariations.length);
                            // print(cubit.productvariations);
                            cubit.allVariationsList.forEach((element) {
                              print(
                                  'llllll:${element.color},${element.size},${element.price}');
                            });
                            Navigator.pop(context);
                          },
                          text: 'Done')),
                  const SizedBox(
                    height: 10,
                  ),
                ],
              ),
            ));
      },
    );
  }
}
