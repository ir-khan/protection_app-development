import 'package:flutter/material.dart';
import 'package:protection_app/app/core/constants/strings.dart';
import 'package:protection_app/app/core/custom/custom_appbar.dart';
import 'package:protection_app/app/screens/settings_tab/support_and_help/widgets/support_and_help_body.dart';

class SupportAndHelpView extends StatelessWidget {
  const SupportAndHelpView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBarBackButton(
        AppStrings.supportAndHelp,
        
      ),
      body: supportAndHelpBody(),
    );
  }
}