import 'package:ecommerceapp/core/data/model/product_model.dart';
import 'package:ecommerceapp/core/utils/app_colors.dart';
import 'package:ecommerceapp/core/utils/app_strings.dart';
import 'package:ecommerceapp/core/utils/assets_manager.dart';
import 'package:flutter/material.dart';

class ProductDetailsScreen extends StatefulWidget {
  const ProductDetailsScreen(
      {Key? key, required this.index, required this.product})
      : super(key: key);
  final int index;

  final Products product;
  @override
  State<ProductDetailsScreen> createState() => _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends State<ProductDetailsScreen> {
  @override
  void initState() {
    size = widget.product.productOptions!.productSizes!.first;
    color = widget.product.productVariants!.first.variantAttributes!
        .variantColor!.colorName!;
    super.initState();
  }

  // @override
  // void dispose() {
  //   super.dispose();
  //   ProductsCubit.get(context).oneProductModel = null;
  // }
  int sizeItemSelectIndex = 0;
  int colorItemSelectIndex = 0;
  String size = '';
  String color = '';
  String changePrice({required String size, required String color}) {
    ProductVariants price = widget.product.productVariants!.firstWhere(
        (element) =>
            element.variantAttributes!.variantColor!.colorName == color &&
            element.variantAttributes!.variantSize == size);
    return price.variantPrice!;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.product.productName!),
        leading: InkWell(
          onTap: () {
            Navigator.pop(context);
          },
          child: Icon(
            Icons.arrow_back_ios,
            color: AppColors.primeryColor,
          ),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          StatefulBuilder(
              builder: ((context, setState) => Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: SizedBox(
                      height: 200,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: FadeInImage.assetNetwork(
                          height: 200,
                          width: double.infinity,
                          placeholder: AppImages.placeholder,
                          image: widget
                              .product
                              .productOptions!
                              .productColors![colorItemSelectIndex]
                              .colorImages![0],
                          fit: BoxFit.cover,
                          imageErrorBuilder: (c, o, s) => Image.asset(
                              AppImages.placeholder,
                              fit: BoxFit.cover),
                        ),
                      ),
                    ),
                  ))),
          const SizedBox(
            height: 30,
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Text(
              '\$ ${changePrice(size: size, color: color)}',
              style: const TextStyle(
                  color: Colors.black,
                  fontSize: 18,
                  fontFamily: AppStrings.fontFamily),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Row(
              children: [
                const Text(
                  'Color',
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                      fontFamily: AppStrings.fontFamily),
                ),
                const SizedBox(
                  width: 10,
                ),
                Text(
                  widget.product.productOptions!
                      .productColors![colorItemSelectIndex].colorName!,
                  style: TextStyle(
                      color: Colors.black.withOpacity(0.5),
                      fontSize: 14,
                      fontFamily: AppStrings.fontFamily),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 10),
            child: Container(
              height: 40,
              child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  itemBuilder: ((context, index) => InkWell(
                        onTap: () {
                          setState(() {
                            // setState(() {
                            colorItemSelectIndex = index;
                            color = widget.product.productVariants![index]
                                .variantAttributes!.variantColor!.colorName!;
                            // });
                          });
                        },
                        child: Container(
                          height: 30,
                          padding: const EdgeInsets.all(7),
                          decoration: BoxDecoration(
                              color: color ==
                                      widget
                                          .product
                                          .productVariants![index]
                                          .variantAttributes!
                                          .variantColor!
                                          .colorName!
                                  ? Colors.grey
                                  : Colors.white,
                              borderRadius: BorderRadius.circular(5),
                              border:
                                  Border.all(color: AppColors.primeryColor)),
                          child: Center(
                            child: Text(
                              widget.product.productVariants![index]
                                  .variantAttributes!.variantColor!.colorName!,
                              style: const TextStyle(
                                fontFamily: AppStrings.fontFamily,
                                fontSize: 14,
                              ),
                            ),
                          ),
                        ),
                      )),
                  separatorBuilder: ((context, index) => const SizedBox(
                        width: 5,
                      )),
                  itemCount:
                      widget.product.productOptions!.productColors!.length),
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Row(
              children: [
                const Text(
                  'Size',
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                      fontFamily: AppStrings.fontFamily),
                ),
                const SizedBox(
                  width: 10,
                ),
                Text(
                  widget.product.productOptions!
                      .productSizes![sizeItemSelectIndex],
                  style: TextStyle(
                      color: Colors.black.withOpacity(0.5),
                      fontSize: 14,
                      fontFamily: AppStrings.fontFamily),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 10),
            child: Container(
              height: 40,
              child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  itemBuilder: ((context, index) => TextButton(
                        onPressed: () {
                          setState(() {
                            sizeItemSelectIndex = index;
                            size = widget
                                .product.productOptions!.productSizes![index];
                          });
                        },
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all(size ==
                                  widget.product.productOptions!
                                      .productSizes![index]
                              ? Colors.grey
                              : Colors.transparent),
                          shape: MaterialStateProperty.all(
                              RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(7.0),
                                  side: BorderSide(
                                      color: AppColors.primeryColor))),
                        ),
                        child: Text(
                          widget.product.productOptions!.productSizes![index],
                          style: TextStyle(
                            fontFamily: AppStrings.fontFamily,
                            fontSize: 14,
                            color: AppColors.primeryColor,
                          ),
                        ),
                      )),
                  separatorBuilder: ((context, index) => const SizedBox(
                        width: 5,
                      )),
                  itemCount:
                      widget.product.productOptions!.productSizes!.length),
            ),
          ),
        ],
      ),
    );
  }
}
