import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:protection_app/app/core/custom/custom_elevated_button.dart';
import 'package:protection_app/app/core/custom/custom_text.dart';
import 'package:protection_app/app/core/device_padding/device_padding.dart';
import 'package:protection_app/app/core/device_size/device_size.dart';
import 'package:protection_app/app/core/navigation_helper/navigation_helper.dart';
import 'package:protection_app/app/screens/home_tab/photo_vault/bloc/photo_vault_bloc.dart';

class VaultOnboardingView extends StatelessWidget {
  const VaultOnboardingView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PhotoVaultBloc, PhotoVaultState>(
      builder: (context, state) {
        var bloc = context.read<PhotoVaultBloc>();
        return Scaffold(
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerFloat,
          floatingActionButton: customElevatedButton(
            () {
              bloc.nextPage();
            },
            "Next",
          ),
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
            controller: bloc.pageController,
            physics: const NeverScrollableScrollPhysics(),
            children: [
              Padding(
                padding: DevicePadding.medium.symetricVerticalx2,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      width: DeviceSize.width! * 0.8,
                      height: DeviceSize.height! * 0.3,
                      decoration: const BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage("assets/images/photo_vault_1.png"),
                        ),
                      ),
                    ),
                    Gap(DeviceSize.height! * 0.025),
                    customTextBarTitle(
                      "Keep your private photos safe in Photo Vault",
                      TextAlign.center,
                    ),
                    Gap(DeviceSize.height! * 0.025),
                    customTextContent(
                      "The photo vault is a secure, encrypted folder on your phone. Your photos never leave your device and no one can see them without a password.",
                      TextAlign.center,
                    ),
                  ],
                ),
              ),
              Padding(
                padding: DevicePadding.medium.symetricVerticalx2,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      width: DeviceSize.width! * 0.8,
                      height: DeviceSize.height! * 0.3,
                      decoration: const BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage("assets/images/photo_vault_2.png"),
                        ),
                      ),
                    ),
                    Gap(DeviceSize.height! * 0.025),
                    customTextBarTitle(
                      "Important Information",
                      TextAlign.center,
                    ),
                    Gap(DeviceSize.height! * 0.025),
                    customTextContent(
                      "If you uninstall the application, your photos in the photo vault will be gone forever. So don't forget to import your photos before deleting the app.",
                      TextAlign.center,
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
