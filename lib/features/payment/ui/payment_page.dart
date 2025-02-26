import 'package:flutter/material.dart';
import 'package:souq/features/payment/ui/widget/custom_stepper.dart';

// ignore: must_be_immutable
class ShippingPage extends StatelessWidget {
  ShippingPage({super.key});

  bool copyBillingAddress = false;

  String selectedShippingMethod = 'free';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only( top: 16.0,),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                    onTap: () => Navigator.pop(context),
                    child: Image.asset('assets/Frame 33101.png', width: 50),
                  ),
                  const Text("Payment",
                      style: TextStyle(color: Colors.white)),
                ],
              ),
              
              Padding(
                padding: const EdgeInsets.symmetric( horizontal: 8.0),
                child: CustomStepper(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
