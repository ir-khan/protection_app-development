import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:protection_app/app/core/constants/colors.dart';
import 'package:protection_app/app/core/custom/custom_text.dart';
import 'package:protection_app/app/core/device_border/device_border.dart';
import 'package:protection_app/app/core/device_padding/device_padding.dart';
import 'package:protection_app/app/core/device_size/device_size.dart';
import 'package:protection_app/app/screens/home_tab/browse_securely/cubit/browse_securely_cubit.dart';

class LocationButton extends StatelessWidget {
  const LocationButton({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BrowseSecurelyCubit, BrowseSecurelyState>(
      builder: (context, state) {
        return Container(
          height: 100,
          width: DeviceSize.width,
          decoration: BoxDecoration(
            color: AppColors.darkGrey,
            borderRadius: DeviceBorder.fix.circularRadius,
          ),
          padding: DevicePadding.medium.onlyHorizontal,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              customTextContentTitle(
                  "Your current location seems to others as:"),
              const Gap(5),
              Row(
                children: [
                  CircleAvatar(
                    backgroundImage: AssetImage(
                      state.selectedVpn.flagPath!,
                    ),
                  ),
                  const Gap(15),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      customTextContent(state.selectedVpn.vpnName!),
                      customTextContentBlur("Fastest location"),
                      // customTextContentBlur(
                      //     "Virtual IP Adress: 93.38.152.125"),
                    ],
                  )
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}
