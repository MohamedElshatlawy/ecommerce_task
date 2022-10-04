import 'package:ecommerceapp/core/utils/app_colors.dart';
import 'package:ecommerceapp/features/screens/auth/widgets/custom_TextFormField.dart';
import 'package:ecommerceapp/features/screens/auth/widgets/custom_button.dart';
import 'package:ecommerceapp/features/screens/home/cubit/products_cubit.dart';
import 'package:ecommerceapp/features/widgets/Add_Sizess_Dialog.dart';
import 'package:ecommerceapp/features/widgets/add_variations_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/data/model/variation_model.dart';
import '../../../../core/utils/app_strings.dart';
import '../../../widgets/Add_ColorImages_Dialog.dart';

class AddProductScreen extends StatefulWidget {
  AddProductScreen({Key? key}) : super(key: key);
  int index = 0;

  @override
  State<AddProductScreen> createState() => _AddProductScreenState();
}

class _AddProductScreenState extends State<AddProductScreen> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController _productNameController = TextEditingController();
  ScrollController sizeListView = ScrollController();
  //List<DynamicColorAndImage> dynamicColorImage = [];

  //final TextEditingController _passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    var cubit = ProductsCubit.get(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          AppStrings.addProductTitle,
          style: TextStyle(fontFamily: AppStrings.fontFamily),
        ),
        centerTitle: true,
      ),
      body:
          // listener: (context, state) {
          //   // TODO: implement listener
          // },
          // builder: (context, state) {
          // var cubit = ProductsCubit.get(context);
          SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: CustomtextFormField(
                  controller: cubit.productNameController,
                  hintText: "Product Name"),
            ),
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "Add Product Colors",
                    style: TextStyle(
                        fontFamily: AppStrings.fontFamily, fontSize: 16),
                  ),
                  Container(
                    height: 50,
                    width: 50,
                    alignment: Alignment.center,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          primary: AppColors.primeryColor, elevation: 2),
                      onPressed: () {
                        showDialog(
                          barrierColor: Colors.black26,
                          barrierDismissible: true,
                          context: context,
                          builder: (context) {
                            return CustomAlertDialog();
                          },
                        );
                      },
                      child: const Icon(
                        Icons.add,
                        color: Colors.white,
                      ),
                    ),
                  )
                ],
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            BlocBuilder<ProductsCubit, ProductsState>(
                builder: (context, state) {
              var cubit = ProductsCubit.get(context);
              return cubit.colorImageList.isNotEmpty
                  ? ListView.separated(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemBuilder: ((context, index) =>
                          buildColorImageSelected(cubit.colorImageList[index])),
                      itemCount: cubit.colorImageList.length,
                      separatorBuilder: ((context, index) {
                        return const SizedBox(
                          height: 2.5,
                        );
                      }),
                    )
                  : const SizedBox();
            }),
            const SizedBox(
              height: 5,
            ),
            Container(
              height: 1.5,
              color: AppColors.hintColor.withOpacity(0.5),
            ),
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "Add Product Sizes",
                    style: TextStyle(
                        fontFamily: AppStrings.fontFamily, fontSize: 16),
                  ),
                  Container(
                    height: 50,
                    width: 50,
                    alignment: Alignment.center,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          primary: AppColors.primeryColor, elevation: 2),
                      onPressed: () {
                        showDialog(
                          barrierColor: Colors.black26,
                          barrierDismissible: true,
                          context: context,
                          builder: (context) {
                            return AddSizesDialog();
                          },
                        ).then((value) => setState(() {}));
                      },
                      child: const Icon(
                        Icons.add,
                        color: Colors.white,
                      ),
                    ),
                  )
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            BlocConsumer<ProductsCubit, ProductsState>(
                listener: (context, state) {
              if (state is AddNewProductSuccessfully) {
                setState(() {});
              }
            }, buildWhen: ((previous, current) {
              return current is AddProductSize;
            }), builder: (context, state) {
              var cubit = ProductsCubit.get(context);
              // var list = cubit.productSizes;

              return cubit.productSizes.isNotEmpty
                  ? Padding(
                      key: UniqueKey(),
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: SizedBox(
                        // key: UniqueKey(),
                        height: 50,
                        child: ListView.separated(
                          controller: sizeListView,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: ((context, index) =>
                              buildSize(cubit.productSizes[index])),
                          itemCount: cubit.productSizes.length,
                          separatorBuilder: ((context, index) {
                            return const SizedBox(
                              width: 5,
                            );
                          }),
                        ),
                      ),
                    )
                  : const SizedBox();
            }),
            const SizedBox(
              height: 20,
            ),
            Container(
              height: 1.5,
              color: AppColors.hintColor.withOpacity(0.5),
            ),
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "Add Product Variations",
                    style: TextStyle(
                        fontFamily: AppStrings.fontFamily, fontSize: 16),
                  ),
                  Container(
                    height: 50,
                    width: 50,
                    alignment: Alignment.center,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          primary: AppColors.primeryColor, elevation: 2),
                      onPressed: () {
                        var cubit = ProductsCubit.get(context);
                        if (cubit.allVariationsList.length !=
                            cubit.productSizes.length *
                                cubit.colorImageList.length) {
                          cubit.productSizes.forEach((element) {
                            cubit.colorImageList.forEach((item) {
                              cubit.allVariationsList.add(VariationModel(
                                  size: element, color: item['colorName']));
                            });
                          });
                        }
                        showDialog(
                          barrierColor: Colors.black26,
                          barrierDismissible: true,
                          context: context,
                          builder: (context) {
                            return AddVariationsDialog();
                          },
                        );
                      },
                      child: const Icon(
                        Icons.add,
                        color: Colors.white,
                      ),
                    ),
                  )
                ],
              ),
            ),
            ///////////////////////
            const SizedBox(
              height: 20,
            ),
            BlocBuilder<ProductsCubit, ProductsState>(
                builder: (context, state) {
              return Center(
                child: state is AddNewProduct
                    ? SizedBox(
                        width: 25,
                        child: CircularProgressIndicator(
                            color: AppColors.primeryColor),
                      )
                    : SizedBox(
                        width: 150,
                        child: CustomButton(
                            btnColor: AppColors.primeryColor,
                            onPressed: () {
                              var cubit = ProductsCubit.get(context);
                              cubit.addNewProduct(context);
                            },
                            text: 'Add')),
              );
            }),

            //////////////////////
            const SizedBox(
              height: 150,
            ),
          ],
        ),
      ),
      //   },
      // ),
    );
  }

  Widget buildColorImageSelected(Map<String, dynamic> data) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            data['colorName'],
          ),
          Image(
            image: FileImage(data['colorImage']),
            height: 50,
            width: 50,
          )
        ],
      ),
    );
  }

  Widget buildSize(String size) {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        border: Border(
            bottom: BorderSide(color: AppColors.primeryColor),
            left: BorderSide(color: AppColors.primeryColor),
            right: BorderSide(color: AppColors.primeryColor),
            top: BorderSide(color: AppColors.primeryColor)),
      ),
      child: Center(
        child: Text(size),
      ),
    );
  }
}
