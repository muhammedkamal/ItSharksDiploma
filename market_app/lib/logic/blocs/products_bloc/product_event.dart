part of 'product_bloc.dart';

abstract class ProductEvent extends Equatable {
  const ProductEvent();

  @override
  List<Object> get props => [];
}

class LoadAllProducts extends ProductEvent {}

class AddProduct extends ProductEvent {
  final Map<String, dynamic> product;

  const AddProduct(this.product);
  @override
  List<Object> get props => [product];
}

class UpdateProduct extends ProductEvent {
  final Product product;

  const UpdateProduct(this.product);
  @override
  List<Object> get props => [product];
}

class DeleteProduct extends ProductEvent {
  final String productId;

  const DeleteProduct(this.productId);
  @override
  List<Object> get props => [productId];
}
