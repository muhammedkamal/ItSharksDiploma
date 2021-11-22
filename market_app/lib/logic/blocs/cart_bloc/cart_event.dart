part of 'cart_bloc.dart';

abstract class CartEvent extends Equatable {
  const CartEvent();

  @override
  List<Object> get props => [];
}

class AddProductToCart extends CartEvent {
  final Product product;

  const AddProductToCart(this.product);
  @override
  List<Object> get props => [product];
}

class LoadCartItems extends CartEvent {}

class RemoveProductFromCart extends CartEvent {
  final String productId;

  const RemoveProductFromCart(this.productId);
  @override
  List<Object> get props => [productId];
}
