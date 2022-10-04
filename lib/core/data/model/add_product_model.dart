class AddProductModel {
  Product? product;
  String? message;
  int? status;

  AddProductModel({this.product, this.message, this.status});

  AddProductModel.fromJson(Map<String, dynamic> json) {
    product =
        json['product'] != null ? new Product.fromJson(json['product']) : null;
    message = json['message'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.product != null) {
      data['product'] = this.product!.toJson();
    }
    data['message'] = this.message;
    data['status'] = this.status;
    return data;
  }
}

class Product {
  String? productName;
  ProductOptions? productOptions;
  List<String>? productVariants;
  String? sId;
  String? createdAt;
  String? updatedAt;
  int? iV;

  Product(
      {this.productName,
      this.productOptions,
      this.productVariants,
      this.sId,
      this.createdAt,
      this.updatedAt,
      this.iV});

  Product.fromJson(Map<String, dynamic> json) {
    productName = json['productName'];
    productOptions = json['productOptions'] != null
        ? new ProductOptions.fromJson(json['productOptions'])
        : null;
    productVariants = json['productVariants'].cast<String>();
    sId = json['_id'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['productName'] = this.productName;
    if (this.productOptions != null) {
      data['productOptions'] = this.productOptions!.toJson();
    }
    data['productVariants'] = this.productVariants;
    data['_id'] = this.sId;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    data['__v'] = this.iV;
    return data;
  }
}

class ProductOptions {
  List<String>? productSizes;
  List<ProductColors>? productColors;

  ProductOptions({this.productSizes, this.productColors});

  ProductOptions.fromJson(Map<String, dynamic> json) {
    productSizes = json['productSizes'].cast<String>();
    if (json['productColors'] != null) {
      productColors = <ProductColors>[];
      json['productColors'].forEach((v) {
        productColors!.add(new ProductColors.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['productSizes'] = this.productSizes;
    if (this.productColors != null) {
      data['productColors'] =
          this.productColors!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class ProductColors {
  List<String>? colorImages;
  String? colorName;
  String? sId;

  ProductColors({this.colorImages, this.colorName, this.sId});

  ProductColors.fromJson(Map<String, dynamic> json) {
    colorImages = json['colorImages'].cast<String>();
    colorName = json['colorName'];
    sId = json['_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['colorImages'] = this.colorImages;
    data['colorName'] = this.colorName;
    data['_id'] = this.sId;
    return data;
  }
}
