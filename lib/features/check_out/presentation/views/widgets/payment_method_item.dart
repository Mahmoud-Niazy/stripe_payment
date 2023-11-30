import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class PaymentMethodItem extends StatelessWidget {
  final String image;
  final bool isSelected;

  const PaymentMethodItem({
    super.key,
    required this.image,
    this.isSelected = false,
  });

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(
        milliseconds: 500,
      ),
      width: 100,
      height: 60,
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
            width: 2,
            color: isSelected ? Colors.green : Colors.grey,
          )),
      child: SvgPicture.asset(image),
    );
  }
}
