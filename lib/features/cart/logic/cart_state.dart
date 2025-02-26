

part of 'cart_cubit.dart';

abstract class CartState {}

class CartInitial extends CartState {}

class CartLoading extends CartState {}

class CartLoaded extends CartState {
  final List<ProductItemModel> cartItems;

  CartLoaded({required this.cartItems});
}


final class QuantityCounterLoaded extends CartState {
  final Map<String, int> quantities;
  QuantityCounterLoaded({required this.quantities});
}