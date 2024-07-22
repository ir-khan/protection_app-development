import 'package:flutter/material.dart';
import 'package:protection_app/app/core/constants/colors.dart';

class PaywallTextButton extends StatelessWidget {
  const PaywallTextButton({
    super.key,
    required this.buttonTitle,
    required this.onTap,
  });
  final String buttonTitle;
  final void Function() onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Text(
        buttonTitle,
        style: const TextStyle(
          decoration: TextDecoration.underline,
          decorationColor: TextColors.grey,
          color: TextColors.grey,
        ),
      ),
    );
  }
}
