import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:openvpn_flutter/openvpn_flutter.dart';
import 'package:protection_app/app/core/constants/colors.dart';
import 'package:protection_app/app/core/constants/strings.dart';
import 'package:protection_app/app/core/custom/custom_elevated_button.dart';
import 'package:protection_app/app/core/navigation_helper/navigation_helper.dart';
import 'package:protection_app/app/screens/home/view/home_view.dart';
import 'package:protection_app/app/screens/home_tab/browse_securely/cubit/browse_securely_cubit.dart';
import 'package:protection_app/app/screens/home_tab/browse_securely/widgets/vpn_model.dart';

class WebProtectionActivate extends StatefulWidget {
  const WebProtectionActivate({Key? key}) : super(key: key);

  @override
  _WebProtectionActivateState createState() => _WebProtectionActivateState();
}

class _WebProtectionActivateState extends State<WebProtectionActivate> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BrowseSecurelyCubit, BrowseSecurelyState>(
      builder: (context, state) {
        var cubit = context.read<BrowseSecurelyCubit>();
        return Scaffold(
          appBar: AppBar(
            title: const Text(
              AppStrings.webProtection,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontWeight: FontWeight.w700,
                fontSize: 16,
                color: Color(0xffF9F9F9),
              ),
            ),
            leading: IconButton(
              onPressed: () => Navigation.pushReplace(page: const HomeView()),
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
                  () {
                    if (state.vpnUsa == VpnModel()) {
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
                      cubit.connectUsa();
                      print('object');
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
          body: SafeArea(
            child: Column(
              children: [
                const Image(
                  image: AssetImage(
                    AssetsPath.webProtection,
                  ),
                ),
                const SizedBox(height: 20),
                const Text(
                  'Enable Web Protection',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: TextColors.white,
                    fontSize: 24,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                const SizedBox(height: 20),

                /// Web protection won't slow down your phone, we recommend keeping it on to stay safe at all times.
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    state.stage == VPNStage.connected
                        ? "Web protection won't slow down your phone, we recommend keeping it on to stay safe at all times."
                        : 'With the Web Protection feature, we provide you with a safe internet experience by blocking harmful websites.',
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      color: TextColors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                const Spacer(),

                // ElevatedButton(
                //   style: ElevatedButton.styleFrom(
                //     shape: RoundedRectangleBorder(
                //         borderRadius: BorderRadius.circular(18)),
                //     fixedSize:
                //         Size(MediaQuery.of(context).size.width * 0.8, 60),
                //   ),
                //   onPressed: () {
                //     // Navigation.push(page: const WebProtectionActivate());
                //   },
                //   child: const Text(
                //     'Activate',
                //     style: TextStyle(
                //       color: TextColors.black,
                //       fontSize: 20,
                //       fontWeight: FontWeight.w500,
                //     ),
                //   ),
                // )
              ],
            ),
          ),
        );
      },
    );
  }
}
