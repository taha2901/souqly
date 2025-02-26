import 'package:flutter/material.dart';
import 'package:souq/core/helpers/spacing.dart';
import 'package:souq/core/theming/styles.dart';

class ShippingWidget extends StatelessWidget {
  const ShippingWidget({
    super.key,
    required this.fullNameController,
    required this.phoneNumberController,
    required this.cityController,
    required this.streetController,
    required this.zipCodeController,
  });

  final TextEditingController fullNameController;
  final TextEditingController phoneNumberController;
  final TextEditingController cityController;
  final TextEditingController streetController;
  final TextEditingController zipCodeController;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextFormField(
            controller: fullNameController,
            decoration: const InputDecoration(
              labelText: "Full Name",
            )),
        verticalSpace(10),
        TextFormField(
          controller: phoneNumberController,
          decoration: InputDecoration(
            labelText: "Phone Number",
            labelStyle: TextStyles.font14BlackRegular,
          ),
        ),
        verticalSpace(10),
        TextFormField(
          controller: cityController,
          decoration: InputDecoration(
            labelText: "City",
            labelStyle: TextStyles.font14BlackRegular,
          ),
        ),
        verticalSpace(10),
        TextFormField(
          controller: streetController,
          decoration: InputDecoration(
            labelText: "Street",
            labelStyle: TextStyles.font14BlackRegular,
          ),
        ),
        verticalSpace(10),
        TextFormField(
          controller: zipCodeController,
          decoration: InputDecoration(
            labelText: "Zib Code",
            labelStyle: TextStyles.font14BlackRegular,
          ),
        ),
        verticalSpace(10),
        Text(
          'Billing Address',
          style: TextStyles.font16BlackRegular,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Checkbox(
              value: false,
              onChanged: (value) {},
            ),
            Text('Copy address data from shipping'),
          ],
        ),
        verticalSpace(10),
        Text(
          'Shipping Methods',
          style: TextStyles.font16BlackRegular,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Radio(
              value: false,
              groupValue: false,
              onChanged: (value) {},
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Free   Delivery to home ',
                  style: TextStyles.font16BlackRegularLato,
                ),
                Text(
                  'Delivery from 3 to 7 business days',
                  style: TextStyles.font12LighterGreyRegular,
                ),
              ],
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Radio(
              value: false,
              groupValue: false,
              onChanged: (value) {},
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '50.00LE   Delivery to home ',
                  style: TextStyles.font16BlackRegularLato,
                ),
                Text(
                  'Delivery from 3 to 7 business days',
                  style: TextStyles.font12LighterGreyRegular,
                ),
              ],
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Radio(
              value: false,
              groupValue: false,
              onChanged: (value) {},
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '50.00LE   Fast Delivery ',
                  style: TextStyles.font16BlackRegularLato,
                ),
                Text(
                  'Delivery from 3 to 7 business days',
                  style: TextStyles.font12LighterGreyRegular,
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }
}
