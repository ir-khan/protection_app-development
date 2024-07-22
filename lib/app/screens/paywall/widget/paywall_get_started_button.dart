import 'package:flutter/material.dart';
import 'package:protection_app/app/core/constants/colors.dart';

class PaywallGetStartedButton extends StatelessWidget {
  const PaywallGetStartedButton({
    super.key,
    required this.buttonTitle,
    required this.onTap,
  });

  final void Function() onTap;
  final String buttonTitle;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: MediaQuery.of(context).size.height * 0.07,
        width: MediaQuery.of(context).size.width * 0.8,
        decoration: BoxDecoration(
          color: AppColors.primary,
          borderRadius: BorderRadius.circular(18),
        ),
        child: Align(
          alignment: Alignment.center,
          child: Text(
            buttonTitle,
            style: const TextStyle(
              color: TextColors.black,
              fontWeight: FontWeight.w600,
              fontSize: 20,
            ),
          ),
        ),
      ),
    );
  }
}
