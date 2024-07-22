import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:openvpn_flutter/openvpn_flutter.dart';

import 'package:protection_app/app/core/constants/strings.dart';
import 'package:protection_app/app/core/custom/custom_elevated_button.dart';
import 'package:protection_app/app/core/custom/custom_text.dart';
import 'package:protection_app/app/core/device_size/device_size.dart';
import 'package:protection_app/app/core/navigation_helper/navigation_helper.dart';
import 'package:protection_app/app/screens/home_tab/browse_securely/cubit/browse_securely_cubit.dart';
import 'package:protection_app/app/screens/home_tab/browse_securely/widgets/location_button.dart';
import 'package:protection_app/app/screens/home_tab/browse_securely/widgets/vpn_list_view.dart';
import 'package:protection_app/app/screens/home_tab/browse_securely/widgets/vpn_model.dart';

class BrowseSecurelyView extends StatelessWidget {
  const BrowseSecurelyView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BrowseSecurelyCubit, BrowseSecurelyState>(
      builder: (context, state) {
        var cubit = context.read<BrowseSecurelyCubit>();
        return Scaffold(
          appBar: AppBar(
            title: const Text(
              AppStrings.browseSecurely,
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
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerFloat,
          floatingActionButton: state.stage == VPNStage.connected
              ? customElevatedButtonSecondary(
                  () {
                    cubit.disconnect();
                  },
                  "Disable",
                )
              : customElevatedButton(
                  state.selectedVpn == VpnModel()
                      ? null
                      : () {
                          if (state.selectedVpn == VpnModel()) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: const Text("Please select a server."),
                                action: SnackBarAction(
                                  label: 'Okey',
                                  onPressed: () {
                                    // Code to execute.
                                  },
                                ),
                              ),
                            );
                          } else {
                            cubit.connect();
                          }
                        },
                  state.stage == VPNStage.disconnected &&
                          state.stage == VPNStage.unknown
                      ? "Activate"
                      : state.stage == VPNStage.connecting
                          ? "Connecting"
                          : "Activate",
                  state.stage == VPNStage.connecting
                      ? Platform.isIOS
                          ? const CupertinoActivityIndicator()
                          : const CircularProgressIndicator()
                      : SizedBox.fromSize(),
                  const SizedBox(
                    width: 10,
                  ),
                ),
          body: Stack(
            children: [
              Positioned(
                bottom: 0,
                child: Container(
                  height: MediaQuery.of(context).size.height * 0.3,
                  width: MediaQuery.of(context).size.width,
                  decoration: const BoxDecoration(
                      // color: Colors.transparent,
                      gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Colors.transparent,
                      Color(0xff000000),
                    ],
                  )),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      width: DeviceSize.width! * 0.8,
                      height: DeviceSize.height! * 0.3,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage(state.stage == VPNStage.connected
                              ? AssetsPath.browseSecurely
                              : AssetsPath.enable),
                        ),
                      ),
                    ),
                    Gap(DeviceSize.height! * 0.025),
                    // state.stage == VPNStage.connected
                    //     ? customTextBarTitleActivate(
                    //         "VPN Secure Connection is active",
                    //         TextAlign.center,
                    //       )
                    //     : customTextBarTitle(
                    //         "Enable VPN Secure Connection",
                    //         TextAlign.center,
                    //       ),
                    // state.stage == VPNStage.connected
                    //     ? const Text(
                    //         "Connected",
                    //         style: TextStyle(color: Colors.white),
                    //       )
                    //     : const SizedBox.shrink(),
                    // state.stage == VPNStage.connecting
                    //     ? const Text(
                    //         "Connecting",
                    //         style: TextStyle(color: Colors.white),
                    //       )
                    //     : const SizedBox.shrink(),
                    // Gap(DeviceSize.height! * 0.025),
                    customTextContent(
                      state.stage == VPNStage.connected
                          ? "Enjoy enhanced privacy and a secure connection for your banking and shopping activities."
                          : "Utilize your new VPN for confident banking and shopping.",
                      TextAlign.center,
                    ),
                    Gap(DeviceSize.height! * 0.025),
                    state.stage == VPNStage.connected
                        ? const LocationButton()
                        : ListTile(
                            onTap: () {
                              // Navigation.push(page: const VpnListView());
                            },
                            title: const Text("Select VPN Server"),
                            textColor: Colors.white,
                          ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.22,
                      child: state.stage == VPNStage.connected
                          ? const SizedBox.shrink()
                          : const VpnListView(),
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
