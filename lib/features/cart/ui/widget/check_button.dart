import 'package:flutter/material.dart';
import 'package:souq/core/routings/routers.dart';
import 'package:souq/core/theming/styles.dart';

class CheckoutButton extends StatefulWidget {
  const CheckoutButton({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _CheckoutButtonState createState() => _CheckoutButtonState();
}

class _CheckoutButtonState extends State<CheckoutButton> {
  bool isClicked = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 32),
      child: SizedBox(
        width: double.infinity,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor:
                isClicked ? Colors.white : Colors.teal, 
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10), 
              side: BorderSide(
                  color: Colors.teal, width: 2), 
            ),
            padding: const EdgeInsets.symmetric(vertical: 16),
          ),
          onPressed: () {
            if (isClicked) {
              Navigator.of(context, rootNavigator: true)
                  .pushNamed(Routers.paymentRoute);
            }
            setState(() {
              isClicked = !isClicked;
            });
          },
          child: Text(
            isClicked ? "Go to Payment" : "Checkout",
            style: TextStyles.font16WhiteRegular.copyWith(
              color: isClicked ? Colors.teal : Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
