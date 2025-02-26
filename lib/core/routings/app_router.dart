import 'package:flutter/material.dart';
import 'package:souq/core/routings/routers.dart';
import 'package:souq/core/widgets/cutome_bottom_nav_bar.dart';
import 'package:souq/features/cart/ui/cart_page.dart';
import 'package:souq/features/payment/ui/payment_page.dart';
import 'package:souq/features/payment/ui/widget/add_new_payment_method.dart';

class AppRouter {
  Route? generateRoute(RouteSettings settings) {
    final arguments = settings.arguments;
    switch (settings.name) {
      case Routers.bottomNavBarRoute:
        return MaterialPageRoute(
          builder: (_) => const CustomBottomNavbar(),
        );
      case Routers.cartRoute:
        return MaterialPageRoute(
          builder: (_) => const CartPage(),
        );
      case Routers.paymentRoute:
        return MaterialPageRoute(
          builder: (_) => ShippingPage(),
        );

      case Routers.addNewPaymentMethodRoute:
        return MaterialPageRoute(
          builder: (_) => const AddNewPaymentMethod(),
        );

      default:
        return null;
    }
  }
}
