import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:otp_text_field/otp_field.dart';
import 'package:otp_text_field/otp_field_style.dart';
import 'package:otp_text_field/style.dart';
import 'package:protection_app/app/core/constants/colors.dart';
import 'package:protection_app/app/core/constants/data.dart';
import 'package:protection_app/app/core/constants/strings.dart';
import 'package:protection_app/app/core/custom/custom_appbar.dart';
import 'package:protection_app/app/core/custom/custom_screen_box.dart';
import 'package:protection_app/app/core/custom/custom_text.dart';
import 'package:protection_app/app/core/device_padding/device_padding.dart';
import 'package:protection_app/app/core/device_size/device_size.dart';
import 'package:protection_app/app/core/navigation_helper/navigation_helper.dart';
import 'package:protection_app/app/routes/routes.dart';

class PhotoVaultView extends StatefulWidget {
  const PhotoVaultView({super.key});

  @override
  State<PhotoVaultView> createState() => _PhotoVaultViewState();
}

class _PhotoVaultViewState extends State<PhotoVaultView> {
  int index = 0;
  String pass = "";
  OtpFieldController otpController = OtpFieldController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(AppStrings.photoVault),
      body: index > 1
          ? passScreens()
          : customScreenBox(
              Data.photoVaultData[index].path,
              Data.photoVaultData[index].title,
              Data.photoVaultData[index].content,
              Data.photoVaultData[index].buttonName,
              Data.photoVaultData[index].activate,
              () {
                if (index <= 3) {
                  setState(
                    () {
                      index++;
                    },
                  );
                }
              },
            ),
    );
  }

  SizedBox passScreens() {
    return SizedBox(
      height: DeviceSize.height,
      width: DeviceSize.width,
      child: Padding(
        padding: DevicePadding.medium.symetricVerticalx2,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            customTextBarTitle(
              Data.photoVaultData[index].title,
              TextAlign.center,
            ),
            Gap(DeviceSize.height! * 0.04),
            OTPTextField(
              controller: otpController,
              contentPadding: DevicePadding.large.all,
              otpFieldStyle: OtpFieldStyle(
                borderColor: AppColors.primary,
                focusBorderColor: AppColors.primary,
                backgroundColor: AppColors.darkGrey,
              ),
              obscureText: true,
              length: 4,
              width: DeviceSize.width!,
              textFieldAlignment: MainAxisAlignment.spaceAround,
              fieldWidth: 65,
              fieldStyle: FieldStyle.box,
              outlineBorderRadius: 8,
              style: const TextStyle(
                color: TextColors.white,
              ),
              onChanged: (pin) {},
              onCompleted: (pin) {
                if (index == 2) {
                  setState(
                    () {
                      pass = pin;
                      index++;
                      otpController.clear();
                    },
                  );
                } else if (index == 3) {
                  setState(
                    () {
                      pass == pin ? index++ : null;
                      otpController.clear();
                    },
                  );
                } else if (index == 4 && pass == pin) {
                  FocusScope.of(context).unfocus();
                  otpController.clear();
                  Navigation.pushNamed(root: Routes.vault);
                } else {
                  otpController.clear();
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
