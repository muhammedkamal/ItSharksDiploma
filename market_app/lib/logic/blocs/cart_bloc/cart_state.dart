part of 'cart_bloc.dart';

abstract class CartState extends Equatable {
  const CartState();

  @override
  List<Object> get props => [];
}

class CartInitial extends CartState {}

class CartLoaded extends CartState {
  final Map<String, CartItem> items;

  const CartLoaded(this.items);
  @override
  List<Object> get props => [items];
}

class CartLoading extends CartState {}
