import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:in_app_review/in_app_review.dart';
import 'package:protection_app/app/core/constants/data.dart';
import 'package:protection_app/app/core/custom/custom_appbar.dart';
import 'package:protection_app/app/core/function/functions.dart';
import 'package:protection_app/app/core/getit/get_it.dart';
import 'package:protection_app/app/core/navigation_helper/navigation_helper.dart';
import 'package:protection_app/app/data/repository/local/app_onboarding_repository.dart';
import 'package:protection_app/app/data/repository/local/isPremium_repository.dart';
import 'package:protection_app/app/routes/routes.dart';
import 'package:protection_app/app/screens/onboarding/widgets/onboarding_body.dart';

class OnboardingView extends StatefulWidget {
  const OnboardingView({super.key});

  @override
  State<OnboardingView> createState() => _OnboardingViewState();
}

class _OnboardingViewState extends State<OnboardingView> {
  @override
  void initState() {
    super.initState();
  }

  int index = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBarNone(),
      body: onboardingBody(
        Data.onboarding[index].path,
        Data.onboarding[index].title,
        Data.onboarding[index].content,
        Data.onboarding[index].buttonName,
        Data.onboarding[index].activate,
        index,
        () {
          if (index < 3) {
            setState(
              () {
                index++;
              },
            );
            if (index == 2) {
              // Functions.showReviewMessage(context, true);
              Functions.reviewStore();
            }
          } else {
            Navigation.pushNamed(
                root: getIt.get<IsPremiumRepository>().getIsPremium() ?? false
                    ? Routes.home
                    : Routes.paywall);
            AppOnboardingRepository().sawAppOnboarding();
          }
        },
      ),
    );
  }
}

enum Availability { loading, available, unavailable }
