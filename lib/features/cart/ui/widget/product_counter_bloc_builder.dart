
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:souq/features/cart/data/product_items_model.dart';
import 'package:souq/features/cart/logic/cart_cubit.dart';
import 'package:souq/features/cart/ui/widget/counter_widget.dart';

// class ProductCounterBlocBuilder extends StatelessWidget {
//   const ProductCounterBlocBuilder({
//     super.key,
//     required this.cubit,
//     required this.product,
//   });

//   final CartCubit cubit;
//   final ProductItemModel product;

//   @override
//   Widget build(BuildContext context) {
//     return BlocBuilder<CartCubit, CartState>(
//       bloc: cubit,
//       buildWhen: (previous, current) =>
//           current is QuantityCounterLoaded ||
//           current is CartLoaded,
//       builder: (context, state) {
//         if (state is QuantityCounterLoaded) {
//           return CounterWidget(
//             value: state.value,
//             productId: product.id,
//             cubit:
//                 BlocProvider.of<CartCubit>(
//                     context),
//           );
//         } else if (state is CartLoaded) {
//           return CounterWidget(
//             value: 1,
//             productId: state.cartItems.first.id,
//             cubit:
//                 BlocProvider.of<CartCubit>(
//                     context),
//           );
//         } else {
//           return const SizedBox.shrink();
//         }
//       },
//     );
//   }
// }




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
