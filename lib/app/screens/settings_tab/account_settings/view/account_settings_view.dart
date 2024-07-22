import 'package:flutter/material.dart';
import 'package:protection_app/app/core/constants/strings.dart';
import 'package:protection_app/app/core/custom/custom_appbar.dart';
import 'package:protection_app/app/screens/settings_tab/account_settings/widgets/account_settings_body.dart';

class AccountSettingsView extends StatelessWidget {
  const AccountSettingsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBarBackButton(
        AppStrings.accountSettings,
      ),
      body: accountSettingsBody(),
    );
  }
}
