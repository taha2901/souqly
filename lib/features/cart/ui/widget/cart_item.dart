import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconsax/iconsax.dart';
import 'package:souq/core/helpers/spacing.dart';
import 'package:souq/core/theming/styles.dart';
import 'package:souq/features/cart/data/product_items_model.dart';
import 'package:souq/features/cart/logic/cart_cubit.dart';
import 'package:souq/features/cart/ui/widget/product_counter_bloc_builder.dart';

class CartItem extends StatelessWidget {
  final ProductItemModel product;

  const CartItem({
    super.key,
    required this.product,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
      child: Padding(
        padding: EdgeInsets.all(12.0.r),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(8.r),
              child: Image.network(
                product.imgUrl,
                width: 80.w,
                height: 80.h,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(width: 12.w),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    product.name,
                    style: TextStyles.font15BlackBold,
                  ),
                  Text(
                    product.category,
                    style: TextStyles.font15greyBold,
                  ),
                  verticalSpace(4),
                  Row(
                    children: [
                      Text(
                         "${product.totalPrice} LE",
                        style: TextStyles.font15BlackBold,
                      ),
                      Spacer(),
                      ProductCounterBlocBuilder(product: product),
                    ],
                  ),
                ],
              ),
            ),
            IconButton(
              icon: const Icon(Iconsax.trash),
              onPressed: () {
                context.read<CartCubit>().removeFromCart(product.id);
              },
            ),
          ],
        ),
      ),
    );
  }
}