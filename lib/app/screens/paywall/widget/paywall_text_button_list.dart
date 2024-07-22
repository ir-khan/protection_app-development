import 'package:flutter/material.dart';
import 'package:protection_app/app/screens/paywall/widget/paywall_text_button.dart';

class PaywallTextButtonList extends StatelessWidget {
  const PaywallTextButtonList({
    super.key,
    required this.termOfUseButton,
    required this.restorePurchaseButton,
    required this.privacyPolicyButton,
  });
  final void Function() termOfUseButton;
  final void Function() restorePurchaseButton;
  final void Function() privacyPolicyButton;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          PaywallTextButton(
            buttonTitle: 'Terms of Use',
            onTap: termOfUseButton,
          ),
          PaywallTextButton(
            buttonTitle: 'Restore Purchase',
            onTap: restorePurchaseButton,
          ),
          PaywallTextButton(
            buttonTitle: 'Privacy Policy',
            onTap: privacyPolicyButton,
          ),
        ],
      ),
    );
  }
}
