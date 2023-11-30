import 'package:flutter/material.dart';

import '../../../../../core/utils/styles.dart';

class TotalPriceItem extends StatelessWidget {
  final String price;

  const TotalPriceItem({
    super.key,
    required this.price,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Text(
          'Total',
          style: AppStyles.style24,
        ),
        Text(
          '\$$price',
          style: AppStyles.style24,
        ),
      ],
    );
  }
}
