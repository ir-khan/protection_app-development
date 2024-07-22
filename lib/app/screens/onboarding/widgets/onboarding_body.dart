import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:protection_app/app/core/constants/colors.dart';
import 'package:protection_app/app/core/constants/strings.dart';
import 'package:protection_app/app/core/custom/custom_dot.dart';
import 'package:protection_app/app/core/custom/custom_elevated_button.dart';
import 'package:protection_app/app/core/custom/custom_text.dart';
import 'package:protection_app/app/core/device_padding/device_padding.dart';
import 'package:protection_app/app/core/device_size/device_size.dart';
import 'package:protection_app/app/core/navigation_helper/navigation_helper.dart';
import 'package:protection_app/app/screens/paywall/view/paywall_view.dart';

SizedBox onboardingBody(String imagepath, String title, String content,
        String buttonName, bool activate, index, void Function() function) =>
    SizedBox(
      height: DeviceSize.height,
      width: DeviceSize.width,
      child: Padding(
        padding: DevicePadding.medium.onboarding,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  width: DeviceSize.width,
                  height: DeviceSize.height! * 0.4,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(imagepath),
                    ),
                  ),
                ),
                Gap(DeviceSize.height! * 0.04),
                customTextBarTitle(
                  title,
                  TextAlign.center,
                ),
                Gap(DeviceSize.height! * 0.04),
                customTextContent(
                  content,
                  TextAlign.center,
                ),
              ],
            ),
            Column(
              children: [
                activate
                    ? RichText(
                        textAlign: TextAlign.center,
                        text: TextSpan(
                          text: AppStrings.onboardingTextOne,
                          children: [
                            TextSpan(
                              text: AppStrings.onboardingTextTwo,
                              style: const TextStyle(
                                color: TextColors.primary,
                                decoration: TextDecoration.underline,
                              ),
                              recognizer: TapGestureRecognizer()
                                ..onTap = () {
                                  //License func
                                  Navigation.push(
                                      page: CustomWebViewWidget(
                                    url:
                                        'https://sites.google.com/neonapps.co/cloak-privacy-security/terms-of-use',
                                  ));
                                  print('object');
                                },
                            ),
                            const TextSpan(
                                text: AppStrings.onboardingTextThree),
                            TextSpan(
                              text: AppStrings.onboardingTextFour,
                              style: const TextStyle(
                                color: TextColors.primary,
                                decoration: TextDecoration.underline,
                              ),
                              recognizer: TapGestureRecognizer()
                                ..onTap = () {
                                  //Privacy func
                                  Navigation.push(
                                      page: CustomWebViewWidget(
                                    url:
                                        'https://sites.google.com/neonapps.co/cloak-privacy-security/privacy-policy',
                                  ));
                                },
                            ),
                          ],
                        ),
                      )
                    : customDot(index, 3),
                const Gap(15),
                customElevatedButton(
                  function,
                  buttonName,
                ),
                Gap(DeviceSize.height! * 0.008),
              ],
            ),
          ],
        ),
      ),
    );
