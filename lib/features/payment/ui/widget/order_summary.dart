
import 'package:flutter/material.dart';

class OrderSummary extends StatelessWidget {
  const OrderSummary({
    super.key,
    required this.context,
  });

  final BuildContext context;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Row(
            children: [
              Text('Products price'),
              Spacer(),
              Text('8000.0LE')
            ],
          ),
          Divider(
            endIndent:
                MediaQuery.of(context).size.width * 0.1,
            indent: MediaQuery.of(context).size.width * 0.1,
          ),
          Row(
            children: [
              Text('Shipping'),
              Spacer(),
              Text('50.0LE')
            ],
          ),
          Divider(
            endIndent:
                MediaQuery.of(context).size.width * 0.1,
            indent: MediaQuery.of(context).size.width * 0.1,
          ),
          Row(
            children: [
              Text('Total'),
              Spacer(),
              Text('50.0LE')
            ],
          )
        ],
      ),
    );
  }
}
