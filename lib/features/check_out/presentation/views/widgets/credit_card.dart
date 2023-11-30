import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../../core/utils/styles.dart';

class CreditCard extends StatelessWidget {
  const CreditCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * .8,
      height: 80,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          SvgPicture.asset('assets/images/master_card.svg'),
          const Text.rich(
            TextSpan(
              children: [
                TextSpan(
                  text: 'Credit Card  ',
                  style: AppStyles.style18,
                ),
                TextSpan(
                  text: 'Mastercard **78 ',
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
