import 'dart:io';

import 'package:dio/dio.dart';
import 'package:ecommerceapp/core/data/model/product_model.dart';
import 'package:ecommerceapp/core/data/repository/products_repository.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http_parser/http_parser.dart';
import 'package:image_picker/image_picker.dart';

import '../../../../core/data/model/product_details.dart';
import '../../../../core/data/model/variation_model.dart';

part 'products_state.dart';

class ProductsCubit extends Cubit<ProductsState> {
  ProductsCubit({required this.productRepository}) : super(ProductsInitial());
  static ProductsCubit get(context) => BlocProvider.of(context);
  final ProductRepository productRepository;
  ProductModel? productModel;
  final TextEditingController productNameController = TextEditingController();

  Future<void> getAllProducts() async {
    emit(GetAllProductsloading());
    productRepository.getAllProducts().then((value) {
      if (value.status == 200) {
        productModel = value;
        print(
            'productModel!.products!.length:${productModel!.products!.length}');
        emit(GetAllProductsloaded());
      }
    }).catchError((e) {
      productModel = null;
      emit(GetAllProductsError());
    });
  }

  OneProductModel? oneProductModel;
  Future<void> getOneProduct({required String id}) async {
    emit(GetOneProductsloading());
    productRepository.getOnrProduct(id: id).then((value) {
      oneProductModel = value;

      emit(GetOneProductsloaded());
    }).catchError((e) {
      emit(GetAllProductsError());
    });
  }

  File? _file;
  // List<File> imageList = [];
  List<VariationModel> allVariationsList = [];
  List<Map<String, dynamic>> colorImageList = [];
  List<Map<String, dynamic>> variationsList = [
    // {"price": 12, "colorname": "colorname", "colorsize": "colorsize"}
  ];
  List<String> productSizes = [];
  List<Map<String, dynamic>> itemsRowData = [];
  PickedFile? _data;

  PickedFile get data => _data!;
  bool isFileChoosed = false;

  File get file => _file!;
  final picker = ImagePicker();

  void choosePhoto() async {
    // isFileChoosed = false;
    // _file = null;

    final pickedFile = await picker.pickImage(
        source: ImageSource.gallery,
        imageQuality: 50,
        maxHeight: 500,
        maxWidth: 500);

    // getImage();
    if (pickedFile != null) {
      isFileChoosed = true;
      _file = File(pickedFile.path);
    } else {
      print('No image selected.');
    }
    //isFileChoosed = false;
    // _file = null;

    emit(ColorImagesProductsSelected());
    // notifyListeners();
  }

  void addColorandImageName(String colorName, File colorImage) {
    // colorNames.add(colorName);
    // imageList.add(colorImage);
    colorImageList.add({'colorName': colorName, "colorImage": colorImage});
    emit(ColorImagesProductsAdded());
  }

  void addProductVariations(
      String colorName, String productSize, String price) {
    // colorNames.add(colorName);
    // imageList.add(colorImage);
    // colorImageList.add({'colorName': colorName, "colorImage": colorImage});
    variationsList.add({
      "productPrice": price,
      "colorName": colorName,
      "productSize": productSize
    });
    emit(AddProductVariations());
  }

  void addProductSizes(String productSize) {
    productSizes.add(productSize);
    emit(AddProductSize());
  }

// String getList() {
//     for (int i = 0; i <= productSizes.length; i++) return productSizes[i];
//   }

  void removeImageFile() {
    _data = null;
    _file = null;
    isFileChoosed = false;
    emit(RemoveImageFile());
  }

  // void pickImage() async {
  //   _data = await picker.getImage(
  //       source: ImageSource.gallery,
  //       maxHeight: 100,
  //       maxWidth: 100,
  //       imageQuality: 20);
  //  // notifyListeners();
  // }
  void addVariationsItems(
      List<Map<String, dynamic>> colorName, List<String> proSize) {
    for (int i = 0; i <= colorName.length; i++) {
      for (int j = 0; j <= proSize.length; j++) {
        itemsRowData.add({
          "colorName": colorName[i]["colorName"],
          "productSize": proSize[j]
        });
      }
    }
    print(itemsRowData);
  }

  List<MultipartFile> dataFile = [];

  Future<void> getAllFiles() async {
    List<String> data = [];

    colorImageList.forEach((element) {
      data.add(element['colorImage'].path);
    });
    await Future.forEach(data, (element) async {
      dataFile.add(
        await MultipartFile.fromFile(
          element.toString(),
          filename: element.toString().split("/").last,
          contentType: MediaType('image', 'jpg'),
        ),
      );
    });
  }

  Future<void> addNewProduct(
    BuildContext context,
  ) async {
    emit(AddNewProduct());
    await getAllFiles();
    List<Map<String, dynamic>> productColors = [];
    List<Map<String, dynamic>> baseVariations = [];
    for (var i = 0; i < colorImageList.length; i++) {
      productColors.add({
        "colorName": colorImageList[i]['colorName'],
        "colorImages": dataFile[i],
      });
    }
    allVariationsList.forEach((element) {
      baseVariations.add({
        "variantPrice": element.price.toString(),
        "variantAttributes": {
          "variantColor": {
            "colorName": element.color,
          },
          "variantSize": element.size
        },
      });
    });

    productRepository
        .addNewProduct(
            productName: productNameController.text,
            productSize: productSizes,
            colorImage: productColors,
            baseVariations: baseVariations)
        .then((value) {
      if (value.status == 200) {
        Fluttertoast.showToast(msg: "${value.message}");
        allVariationsList = [];
        colorImageList = [];
        variationsList = [];
        productSizes = [];
        productNameController.clear();
        emit(AddNewProductSuccessfully());
      }
    }).catchError((e) {
      print(e.toString());
      emit(AddNewProductFailed());
    });
  }
}
