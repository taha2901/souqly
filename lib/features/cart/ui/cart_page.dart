import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:souq/features/cart/ui/widget/cart_item.dart';
import 'package:souq/features/cart/ui/widget/check_button.dart';

import '../logic/cart_cubit.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<CartCubit, CartState>(
        bloc: BlocProvider.of<CartCubit>(context),
        buildWhen: (previous, current) => current is CartLoading || current is CartLoaded,
        builder: (context, state) {

          if (state is CartLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is CartLoaded) {
            return Column(
              children: [
                Expanded(
                  child: ListView.builder(
                    itemCount: state.cartItems.length,
                    itemBuilder: (context, index) {
                      final cartItem = state.cartItems[index];
                      return CartItem(
                        product: cartItem,
                      );
                    },
                  ),
                ),
                CheckoutButton(),
              ],
            );
          } else {
            return const Center(child: Text("Failed to load cart"));
          }
        },
      ),
    );
  }
}
