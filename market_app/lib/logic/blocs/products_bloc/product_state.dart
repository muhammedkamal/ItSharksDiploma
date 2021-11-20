part of 'product_bloc.dart';

abstract class ProductsState extends Equatable {
  const ProductsState();

  @override
  List<Object> get props => [];
}

class ProductInitial extends ProductsState {}

class ProductsLoading extends ProductsState {}

class ProductsLoaded extends ProductsState {
  final List<Product> productsList;

  const ProductsLoaded(this.productsList);
  @override
  List<Object> get props => [productsList];
}

class ProductsLoadingFailed extends ProductsState {}
