import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:protection_app/app/core/constants/data.dart';
import 'package:protection_app/app/core/constants/strings.dart';
import 'package:protection_app/app/core/custom/custom_appbar.dart';
import 'package:protection_app/app/core/custom/custom_elevated_button.dart';
import 'package:protection_app/app/core/custom/custom_text.dart';
import 'package:protection_app/app/core/device_padding/device_padding.dart';
import 'package:protection_app/app/core/device_size/device_size.dart';

class VaultView extends StatefulWidget {
  const VaultView({super.key});

  @override
  State<VaultView> createState() => _VaultViewState();
}

class _VaultViewState extends State<VaultView> {
  int i = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: customAppBar(AppStrings.photoVault),
      body: SizedBox(
        height: DeviceSize.height,
        width: DeviceSize.width,
        child: Padding(
          padding: DevicePadding.medium.symetricVerticalx2,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              i != 0
                  ? ListView()
                  : Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          width: DeviceSize.width! * 0.8,
                          height: DeviceSize.height! * 0.3,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage(Data.photoVaultData[5].path),
                            ),
                          ),
                        ),
                        Gap(DeviceSize.height! * 0.025),
                        customTextBarTitle(
                          Data.photoVaultData[5].title,
                          TextAlign.center,
                        ),
                        Gap(DeviceSize.height! * 0.025),
                        customTextContent(
                          Data.photoVaultData[5].content,
                          TextAlign.center,
                        ),
                      ],
                    ),
              Column(
                children: [
                  customElevatedButton(
                    () => Data.photoVaultData[5].function(context),
                    Data.photoVaultData[5].buttonName,
                  ),
                  Gap(DeviceSize.height! * 0.008),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
