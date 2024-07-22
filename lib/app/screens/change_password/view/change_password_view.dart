import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:otp_text_field/otp_field.dart';
import 'package:otp_text_field/otp_field_style.dart';
import 'package:otp_text_field/style.dart';
import 'package:protection_app/app/core/constants/colors.dart';
import 'package:protection_app/app/core/custom/custom_text.dart';
import 'package:protection_app/app/core/device_padding/device_padding.dart';
import 'package:protection_app/app/core/device_size/device_size.dart';
import 'package:protection_app/app/core/navigation_helper/navigation_helper.dart';
import 'package:protection_app/app/screens/change_password/cubit/change_password_cubit.dart';

class ChangePasswordView extends StatelessWidget {
  const ChangePasswordView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ChangePasswordCubit, ChangePasswordState>(
      bloc: context.read<ChangePasswordCubit>()..getPassword(),
      builder: (context, state) {
        var cubit = context.read<ChangePasswordCubit>();
        return Scaffold(
          appBar: AppBar(
            title: const Text(
              "Change Password",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontWeight: FontWeight.w700,
                fontSize: 16,
                color: Color(0xffF9F9F9),
              ),
            ),
            leading: IconButton(
              onPressed: () => Navigation.ofPop(),
              icon: const Icon(
                Icons.close,
                size: 32,
                color: Color(0xffF9F9F9),
              ),
            ),
          ),
          body: PageView(
            controller: cubit.pageController,
            physics: const NeverScrollableScrollPhysics(),
            pageSnapping: false,
            children: [
              Column(
                children: [
                  customTextBarTitle(
                    "Enter the access code you use",
                    TextAlign.center,
                  ),
                  Gap(DeviceSize.height! * 0.04),
                  OTPTextField(
                    controller: cubit.otpFieldController,
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
                      if (cubit.password == pin) {
                        cubit.nextPage();
                      } else {
                        cubit.otpFieldController.clear();
                        const snackBar = SnackBar(
                            content: SizedBox(
                          height: 50,
                          child: Text('Access code incorrect.'),
                        )
                            // content: Text('Access code incorrect.'),
                            );

                        ScaffoldMessenger.of(context).showSnackBar(snackBar);
                      }
                    },
                  ),
                ],
              ),
              Column(
                children: [
                  customTextBarTitle(
                    "Create access code",
                    TextAlign.center,
                  ),
                  Gap(DeviceSize.height! * 0.04),
                  OTPTextField(
                    controller: cubit.otpFieldController,
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
                      cubit.savePassword(pin);
                      cubit.nextPage();
                    },
                  ),
                ],
              ),
              Column(
                children: [
                  customTextBarTitle(
                    "Confirm access code",
                    TextAlign.center,
                  ),
                  Gap(DeviceSize.height! * 0.04),
                  OTPTextField(
                    controller: cubit.otpFieldController,
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
                      if (state.password == pin) {
                        cubit.changePassword(pin);
                        Navigation.ofPop();
                        cubit.clear();
                      } else {
                        cubit.otpFieldController.clear();
                        const snackBar = SnackBar(
                            content: SizedBox(
                          height: 50,
                          child: Text('Access code incorrect.'),
                        )
                            // content: Text('Access code incorrect.'),
                            );

                        ScaffoldMessenger.of(context).showSnackBar(snackBar);
                      }
                    },
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}
