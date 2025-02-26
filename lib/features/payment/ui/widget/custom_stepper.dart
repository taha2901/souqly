import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:souq/core/routings/app_router.dart';
import 'package:souq/core/routings/routers.dart';
import 'package:souq/core/widgets/app_text_button.dart';
import 'package:souq/features/payment/ui/widget/credit_card_widget.dart';
import 'package:souq/features/payment/ui/widget/order_summary.dart';
import 'package:souq/features/payment/ui/widget/payment_method_card.dart';
import 'package:souq/features/payment/ui/widget/shipping_widget.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';

class CustomStepper extends StatefulWidget {
  const CustomStepper({super.key});

  @override
  State<CustomStepper> createState() => _CustomStepperState();
}

class _CustomStepperState extends State<CustomStepper> {
  final TextEditingController fullNameController = TextEditingController();
  final TextEditingController phoneNumberController = TextEditingController();
  final TextEditingController cityController = TextEditingController();
  final TextEditingController streetController = TextEditingController();
  final TextEditingController zipCodeController = TextEditingController();
  final TextEditingController phoneNumberByVCashController =
      TextEditingController();

  int stepper = 0;
  final PageController _pageController = PageController();
  String? selectedPaymentMethod;
  String otpCode = ""; // متغير لتخزين كود الـ OTP

  final List<String> title = [
    'Continue to payment',
    'Place My Order',
    'Continue Shopping'
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: SizedBox(
            height: MediaQuery.of(context).size.height * 0.08,
            child: Row(
              children: [
                for (int i = 0; i < title.length - 1; i++)
                  Expanded(
                    child: Row(
                      children: [
                        circleStepper(i),
                        Expanded(child: lineStepper(i)),
                      ],
                    ),
                  ),
                circleStepper(title.length - 1),
              ],
            ),
          ),
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.7,
          child: PageView.builder(
            controller: _pageController,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: title.length,
            itemBuilder: (context, index) {
              return stepPage(index);
            },
          ),
        ),
      ],
    );
  }

  Widget stepPage(int index) {
    return SingleChildScrollView(
      child: Column(
        children: [
          if (index == 0)
            ShippingWidget(
              fullNameController: fullNameController,
              phoneNumberController: phoneNumberController,
              cityController: cityController,
              streetController: streetController,
              zipCodeController: zipCodeController,
            ),
          if (index == 1) buildPaymentMethod(),
          if (index == 2) PusrchaseDone(),
          const SizedBox(height: 40),
          Row(
            children: [
              ElevatedButton(
                onPressed: () {
                  if (stepper < title.length - 1) {
                    nextStep();
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text("Process Completed!")),
                    );
                  }
                },
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  foregroundColor: Colors.white,
                  padding:
                      EdgeInsets.symmetric(vertical: 12.h, horizontal: 24.w),
                  textStyle: const TextStyle(
                      fontSize: 18, fontWeight: FontWeight.bold),
                  backgroundColor: Colors.teal,
                ),
                child: Text(title[stepper]),
              ),
              const Spacer(),
              if (index > 0)
                ElevatedButton(
                  onPressed: previousStep,
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(
                        vertical: 12, horizontal: 24),
                    textStyle: const TextStyle(
                        fontSize: 16, fontWeight: FontWeight.bold),
                    backgroundColor: Colors.grey,
                  ),
                  child: const Text("Back"),
                ),
            ],
          ),
        ],
      ),
    );
  }

  Widget buildPaymentMethod() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            PaymentMethodCard(
              imagePath: 'assets/Money icon.png',
              label: 'Cash',
              isSelected: selectedPaymentMethod == 'Cash',
              onTap: () {
                setState(() {
                  selectedPaymentMethod = 'Cash';
                });
              },
            ),
            PaymentMethodCard(
              imagePath: 'assets/Credit Card Icon.png',
              label: 'Credit Card',
              isSelected: selectedPaymentMethod == 'Credit Card',
              onTap: () {
                setState(() {
                  selectedPaymentMethod = 'Credit Card';
                });
              },
            ),
            PaymentMethodCard(
              imagePath: 'assets/Frame 33294.png',
              label: 'Vodafone Cash',
              isSelected: selectedPaymentMethod == 'Vodafone Cash',
              onTap: () {
                setState(() {
                  selectedPaymentMethod = 'Vodafone Cash';
                });
              },
            ),
          ],
        ),
        if (selectedPaymentMethod != null) ...[
          const SizedBox(height: 40),
          if (selectedPaymentMethod == 'Cash') OrderSummary(context: context),
          if (selectedPaymentMethod == 'Vodafone Cash') buildVodafoneCash(),
          if (selectedPaymentMethod == 'Credit Card') ...[
            Row(
              children: [
                const Text("Select Payment Method",
                    style: TextStyle(fontSize: 20)),
                const Spacer(),
                TextButton(
                  onPressed: () {
                    Navigator.pushNamed(context, Routers.addNewPaymentMethodRoute);
                  },
                  child: const Text("Add New +",
                      style: TextStyle(fontSize: 16, color: Colors.red)),
                ),
              ],
            ),
            CreditCardWidget(),
            const SizedBox(height: 40),
            OrderSummary(context: context),
          ],
        ],
      ],
    );
  }

  Widget buildVodafoneCash() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextFormField(
          controller: phoneNumberByVCashController,
          decoration: const InputDecoration(
            labelText: "Phone Number",
          ),
        ),
        const SizedBox(height: 10),
        SizedBox(
          width: 100,
          child: AppTextButton(
            borderRadius: 2,
            buttonText: 'Send Code',
            backgroundColor: Colors.grey,
            textStyle: const TextStyle(color: Colors.white),
            onPressed: () {},
          ),
        ),
        const SizedBox(height: 10),
        const Text(
          "OTP Code *",
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 10),
        Center(
          child: OtpTextField(
            numberOfFields: 5,
            borderColor: const Color(0xFF512DA8),
            showFieldAsBox: true,
            onCodeChanged: (String code) {
              setState(() {
                otpCode = code;
              });
            },
            onSubmit: (String verificationCode) {
              setState(() {
                otpCode = verificationCode;
              });
              showDialog(
                context: context,
                builder: (context) {
                  return AlertDialog(
                    title: const Text("Verification Code"),
                    content: Text('Code entered is $verificationCode'),
                  );
                },
              );
            },
          ),
        ),
        OrderSummary(context: context),
      ],
    );
  }

  void nextStep() {
    if (stepper < title.length - 1) {
      setState(() {
        stepper++;
      });
      _pageController.animateToPage(
        stepper,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }
  }

  Widget lineStepper(int index) {
    return Container(
      height: 5,
      width: double.infinity,
      color: index < stepper ? Colors.black : Colors.black.withOpacity(0.2),
    );
  }

  Widget circleStepper(int index) {
    List<IconData> icons = [
      Icons.location_on,
      Icons.account_balance_wallet,
      Icons.check,
    ];

    return Icon(
      icons[index],
      color: index <= stepper ? Colors.teal : Colors.black.withOpacity(0.3),
      size: 30,
    );
  }

  void previousStep() {
    if (stepper > 0) {
      setState(() {
        stepper--;
      });
      _pageController.animateToPage(
        stepper,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }
  }
}

class PusrchaseDone extends StatelessWidget {
  const PusrchaseDone({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Image.asset(
            'assets/order (1) 2.png',
            width: 110,
            height: 110,
          ),
          SizedBox(height: 20),
          const Text(
            'Thank you for your purchase.',
          ),
          const Text(
            'You can view your order in ‘My Orders’',
          ),
          const Text(
            'section.',
          ),
        ],
      ),
    );
  }
}
