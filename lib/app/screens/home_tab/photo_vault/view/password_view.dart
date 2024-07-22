import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_launcher_icons/constants.dart';
import 'package:gap/gap.dart';
import 'package:otp_text_field/otp_field.dart';
import 'package:otp_text_field/otp_field_style.dart';
import 'package:otp_text_field/style.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:protection_app/app/core/constants/colors.dart';
import 'package:protection_app/app/core/custom/custom_text.dart';
import 'package:protection_app/app/core/device_padding/device_padding.dart';
import 'package:protection_app/app/core/device_size/device_size.dart';
import 'package:protection_app/app/core/navigation_helper/navigation_helper.dart';
import 'package:protection_app/app/data/repository/local/vault_local_repository.dart';
import 'package:protection_app/app/screens/home_tab/photo_vault/bloc/photo_vault_bloc.dart';
import 'package:protection_app/app/screens/home_tab/photo_vault/view/photo_vault_selected_view.dart';

class PasswordView extends StatelessWidget {
  const PasswordView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PhotoVaultBloc, PhotoVaultState>(
      bloc: context.read<PhotoVaultBloc>()..add(const FetchPassword()),
      builder: (context, state) {
        var bloc = context.read<PhotoVaultBloc>()..passwordControl();
        return Scaffold(
          appBar: AppBar(
            title: const Text(
              "Photo Vault",
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
            controller: bloc.passwordPageController,
            physics: const NeverScrollableScrollPhysics(),
            pageSnapping: false,
            children: [
              Column(
                children: [
                  customTextBarTitle(
                    "Create access code",
                    TextAlign.center,
                  ),
                  Gap(DeviceSize.height! * 0.04),
                  OTPTextField(
                    controller: bloc.otpFieldController,
                    contentPadding: DevicePadding.large.all,
                    otpFieldStyle: OtpFieldStyle(
                      borderColor: AppColors.primary,
                      focusBorderColor: AppColors.primary,
                      backgroundColor: AppColors.midGrey,
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
                      fontWeight: FontWeight.w900,
                      fontSize: 24,
                    ),
                    onChanged: (pin) {},
                    onCompleted: (pin) {
                      bloc.add(CreatePassword(pin));
                      bloc.nextPagePassword();
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
                    controller: bloc.otpFieldController,
                    contentPadding: DevicePadding.large.all,
                    otpFieldStyle: OtpFieldStyle(
                      borderColor: AppColors.primary,
                      focusBorderColor: AppColors.primary,
                      backgroundColor: AppColors.midGrey,
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
                      fontWeight: FontWeight.w900,
                      fontSize: 24,
                    ),
                    onChanged: (pin) {},
                    onCompleted: (pin) {
                      if (pin == state.password) {
                        bloc.nextPagePassword();
                        VaultLocalRepository().setVaultPassword(pin);
                        bloc.add(const FetchPassword());
                      } else {
                        bloc.otpFieldController.clear();
                      }
                    },
                  ),
                ],
              ),
              Column(
                children: [
                  customTextBarTitle(
                    "Enter access code",
                    TextAlign.center,
                  ),
                  Gap(DeviceSize.height! * 0.04),
                  OTPTextField(
                    controller: bloc.otpFieldController,
                    contentPadding: DevicePadding.large.all,
                    otpFieldStyle: OtpFieldStyle(
                      borderColor: AppColors.primary,
                      focusBorderColor: AppColors.primary,
                      backgroundColor: AppColors.midGrey,
                      errorBorderColor: Colors.red,
                    ),
                    hasError: false,
                    // inputFormatter: [],1
                    obscureText: true,
                    length: 4,
                    width: DeviceSize.width!,
                    textFieldAlignment: MainAxisAlignment.spaceAround,
                    fieldWidth: 65,
                    fieldStyle: FieldStyle.box,
                    outlineBorderRadius: 8,
                    style: const TextStyle(
                      color: TextColors.white,
                      fontSize: 24,
                      fontWeight: FontWeight.w900,
                    ),
                    onChanged: (pin) {},
                    onCompleted: (pin) {
                      if (bloc.password == pin) {
                        Navigation.ofPop();
                        Navigation.push(page: const PhotoVaultSelectedView());
                      } else {
                        bloc.otpFieldController.clear();
                        const snackBar = SnackBar(
                            content: SizedBox(
                          height: 50,
                          child: Text('Access code incorrect.'),
                        )
                            // content: Text('Access code incorrect.'),
                            );
                        print(bloc.password);

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
