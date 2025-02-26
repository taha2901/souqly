import 'package:flutter_bloc/flutter_bloc.dart';
import '../data/product_items_model.dart';

part 'cart_state.dart';

class CartCubit extends Cubit<CartState> {
  CartCubit() : super(CartInitial());

  final Map<String, int> _quantities = {};

  void getHomeData() {
    emit(CartLoading());
    Future.delayed(const Duration(seconds: 1), () {
      emit(CartLoaded(cartItems: dummyProducts));
    });
  }

  void incrementCounter(String productId) {
    _quantities[productId] = (_quantities[productId] ?? 1) + 1;
    emit(QuantityCounterLoaded(quantities: _quantities));
  }

  void decrementCounter(String productId) {
    if (_quantities.containsKey(productId) && _quantities[productId]! > 1) {
      _quantities[productId] = _quantities[productId]! - 1;
    } else {
      _quantities[productId] = 1;
    }
    emit(QuantityCounterLoaded(quantities: _quantities));
  }

  int getQuantity(String productId) {
    return _quantities[productId] ?? 1;
  }
}
