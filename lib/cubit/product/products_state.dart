import 'package:cubit_api_test/model/failure.dart';
import 'package:cubit_api_test/model/product_model.dart';
import 'package:equatable/equatable.dart';

abstract class ProductsState extends Equatable {
  const ProductsState();
  @override
  List<Object?> get props => [];
}

class ProductsInitial extends ProductsState {}

class ProductsLoading extends ProductsState {}

class ProductLoaded extends ProductsState {
  List<ProductElement> products;

  ProductLoaded({required this.products});
  @override
  List<Object?> get props => [products];
}

class ProductError extends ProductsState {
  final Failure failure;
  ProductError({required this.failure});
  @override
  List<Object?> get props => [failure];
}
