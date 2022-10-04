import 'package:ecommerceapp/core/utils/app_colors.dart';
import 'package:ecommerceapp/core/utils/app_strings.dart';
import 'package:ecommerceapp/features/screens/home/cubit/products_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../details_product/product_details.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    // TODO: implement initState
    var cubit = ProductsCubit.get(context);

    cubit.getAllProducts();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text(
            AppStrings.homeTitle,
            style: TextStyle(fontFamily: AppStrings.fontFamily),
          ),
          centerTitle: true,
        ),
        body: BlocConsumer<ProductsCubit, ProductsState>(
          listener: (context, state) {
            // TODO: implement listener
          },
          builder: (context, state) {
            var cubit = ProductsCubit.get(context);
            return state is GetAllProductsloading
                ? Center(
                    child: CircularProgressIndicator(
                        color: AppColors.primeryColor),
                  )
                : cubit.productModel == null
                    ? const Center(
                        child: Text("No Products"),
                      )
                    : ListView.builder(
                        itemBuilder: (context, index) => InkWell(
                          onTap: () async {
                            // final trails =  await cubit.getOneProduct(
                            //     id: cubit.productModel!.products![index].sId!);
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (ctx) => ProductDetailsScreen(
                                      product:
                                          cubit.productModel!.products![index],
                                      index: index),
                                ));
                          },
                          child: Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: Container(
                                  height: 70.h,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: Colors.white,
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.grey.withOpacity(0.2),
                                        spreadRadius: 5,
                                        blurRadius: 7,
                                        offset: const Offset(
                                            0, 3), // changes position of shadow
                                      ),
                                    ],
                                  ),
                                  child: Center(
                                      child: Text(
                                    cubit.productModel!.products![index]
                                        .productName!,
                                    style: TextStyle(
                                      color: AppColors.primeryColor,
                                      fontFamily: AppStrings.fontFamily,
                                      fontSize: 18,
                                    ),
                                  )),
                                ),
                              ),
                            ],
                          ),
                        ),
                        itemCount: cubit.productModel!.products!.length,
                      );
          },
        ));
  }
}
