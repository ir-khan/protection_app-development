import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:protection_app/app/core/constants/strings.dart';
import 'package:protection_app/app/core/custom/custom_elevated_button.dart';
import 'package:protection_app/app/core/custom/custom_text.dart';
import 'package:protection_app/app/core/device_padding/device_padding.dart';
import 'package:protection_app/app/core/device_size/device_size.dart';
import 'package:protection_app/app/core/navigation_helper/navigation_helper.dart';
import 'package:protection_app/app/screens/home_tab/browse_securely/cubit/browse_securely_cubit.dart';

class BrowseSecurelyOnboardingView extends StatelessWidget {
  const BrowseSecurelyOnboardingView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BrowseSecurelyCubit, BrowseSecurelyState>(
      builder: (context, state) {
        var cubit = context.read<BrowseSecurelyCubit>();
        return Scaffold(
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerFloat,
          floatingActionButton: customElevatedButton(
            () {
              cubit.nextPage();
            },
            "Next",
          ),
          appBar: AppBar(
            title: const Text(
              "VPN Secure Conection",
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
                          image: AssetImage(AssetsPath.browseSecurely),
                        ),
                      ),
                    ),
                    Gap(DeviceSize.height! * 0.025),
                    customTextBarTitle(
                      "Ensure your browsing remains private with VPN Secure Connection.",
                      TextAlign.center,
                    ),
                    Gap(DeviceSize.height! * 0.025),
                    customTextContent(
                      "A VPN creates a secure, private tunnel between your phone and the internet, making data interception highly difficult.",
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
