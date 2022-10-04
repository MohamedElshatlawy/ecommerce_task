part of 'products_cubit.dart';

abstract class ProductsState extends Equatable {
  const ProductsState();

  @override
  List<Object> get props => [];
}

class ProductsInitial extends ProductsState {}

class GetAllProductsloading extends ProductsState {}

class GetAllProductsloaded extends ProductsState {}

class GetAllProductsError extends ProductsState {}

class GetOneProductsloading extends ProductsState {}

class GetOneProductsloaded extends ProductsState {}

class GetOneProductsError extends ProductsState {}

class ColorImagesProductsSelected extends ProductsState {}

class ColorImagesProductsAdded extends ProductsState {}

class RemoveImageFile extends ProductsState {}

class AddProductSize extends ProductsState {}

class AddProductVariations extends ProductsState {}

class AddNewProduct extends ProductsState {}

class AddNewProductSuccessfully extends ProductsState {}

class AddNewProductFailed extends ProductsState {}
