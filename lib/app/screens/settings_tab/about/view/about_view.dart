import 'package:flutter/material.dart';
import 'package:protection_app/app/core/constants/strings.dart';
import 'package:protection_app/app/core/custom/custom_appbar.dart';
import 'package:protection_app/app/screens/settings_tab/about/widgets/about_body.dart';

class AboutView extends StatelessWidget {
  const AboutView({super.key});

  @override
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBarBackButton(
        AppStrings.about,
      ),
      body: aboutBody(),
    );
  }
}
