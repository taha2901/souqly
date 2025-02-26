import 'package:flutter_bloc/flutter_bloc.dart';
import '../data/product_items_model.dart';

part 'cart_state.dart';

class CartCubit extends Cubit<CartState> {
  CartCubit() : super(CartInitial());

  final Map<String, int> _quantities = {};
  List<ProductItemModel> cartItems = [
    ...dummyProducts
  ]; // نسخة قابلة للتعديل من المنتجات

  void getHomeData() {
    emit(CartLoading());
    Future.delayed(const Duration(seconds: 1), () {
      emit(CartLoaded(cartItems: cartItems));
    });
  }

  void _updateCartState() {
    emit(CartLoaded(
        cartItems: List.from(cartItems))); // إعادة إصدار الحالة بالتحديث الجديد
  }

  void incrementCounter(String productId) {
    _quantities[productId] = (_quantities[productId] ?? 1) + 1;
    _updateProductQuantity(productId);
  }

  void decrementCounter(String productId) {
    if (_quantities.containsKey(productId) && _quantities[productId]! > 1) {
      _quantities[productId] = _quantities[productId]! - 1;
    }
    _updateProductQuantity(productId);
  }

  void _updateProductQuantity(String productId) {
    for (int i = 0; i < cartItems.length; i++) {
      if (cartItems[i].id == productId) {
        cartItems[i] = cartItems[i].copyWith(quantity: _quantities[productId]);
        break;
      }
    }
    _updateCartState();
  }

  int getQuantity(String productId) {
    return _quantities[productId] ?? 1;
  }

  void removeFromCart(String productId) {
    cartItems.removeWhere((product) => product.id == productId);
    _quantities.remove(productId); // حذف الكمية المخزنة لهذا المنتج
    _updateCartState();
  }

  double get totalPrice {
    return cartItems.fold(0, (total, product) {
      int quantity = _quantities[product.id] ?? 1; // الحصول على العدد الحالي
      return total + (product.price * quantity);
    });
  }
}
