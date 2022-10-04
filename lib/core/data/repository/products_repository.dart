import 'package:ecommerceapp/core/data/model/product_model.dart';

import '../api/app_api.dart';
import '../model/add_product_model.dart';
import '../model/product_details.dart';

class ProductRepository {
  final Api api;

  ProductRepository(this.api);
  Future<ProductModel> getAllProducts() async {
    final allProduct = await api.getAllProducts();

    return ProductModel.fromJson(allProduct);
  }

  Future<OneProductModel> getOnrProduct({required String id}) async {
    final oneProduct = await api.getOneProducts(id: id);

    return OneProductModel.fromJson(oneProduct);
  }

  Future<AddProductModel> addNewProduct(
      {required String productName,
      required List<Map<String, dynamic>> colorImage,
      required List<Map<String, dynamic>> baseVariations,
      required List<String> productSize}) async {
    final addProductResponse = await api.addProduct(
        productName: productName,
        colorImage: colorImage,
        productSize: productSize,
        baseVariations: baseVariations);
    print('addProductResponse:$addProductResponse');
    return AddProductModel.fromJson(addProductResponse);
  }
}
