
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:souq/features/cart/data/product_items_model.dart';
import 'package:souq/features/cart/logic/cart_cubit.dart';
import 'package:souq/features/cart/ui/widget/counter_widget.dart';


class ProductCounterBlocBuilder extends StatelessWidget {
  const ProductCounterBlocBuilder({
    super.key,
    required this.product,
  });
  final ProductItemModel product;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartCubit, CartState>(
      buildWhen: (previous, current) => current is QuantityCounterLoaded || current is CartLoaded,
      builder: (context, state) {
        int quantity = context.read<CartCubit>().getQuantity(product.id);
        return CounterWidget(
          value: quantity,
          productId: product.id,
          cubit: context.read<CartCubit>(),
        );
      },
    );
  }
}