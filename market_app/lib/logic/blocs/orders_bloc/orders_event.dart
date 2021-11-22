part of 'orders_bloc.dart';

abstract class OrdersEvent extends Equatable {
  const OrdersEvent();

  @override
  List<Object> get props => [];
}

class LoadAllOrders extends OrdersEvent {}

class AddOrder extends OrdersEvent {
  final List<CartItem> products;
  final double total;
  const AddOrder(this.products, this.total);
  @override
  List<Object> get props => [products, total];
}
