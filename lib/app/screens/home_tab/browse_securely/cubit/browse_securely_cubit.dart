import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:openvpn_flutter/openvpn_flutter.dart';
import 'package:network_info_plus/network_info_plus.dart';
import 'package:protection_app/app/core/navigation_helper/navigation_helper.dart';
import 'package:protection_app/app/data/repository/local/local_securaly_repository.dart';
import 'package:protection_app/app/screens/home_tab/browse_securely/view/browse_securely_view.dart';
import 'package:protection_app/app/screens/home_tab/browse_securely/widgets/vpn_model.dart';

part 'browse_securely_state.dart';

class BrowseSecurelyCubit extends Cubit<BrowseSecurelyState> {
  BrowseSecurelyCubit()
      : super(
          BrowseSecurelyState(
              vpns: Platform.isIOS ? VpnList.vpnsIos : VpnList.vpnsAndroid,
              stage: VPNStage.unknown,
              selectedVpn: VpnModel(),
              userIP: "",
              vpnUsa:
                  Platform.isIOS ? VpnList.vpnUsaIos : VpnList.vpnUsaAndroid),
        ) {
    init();
  }

  PageController pageController = PageController();

  bool isInitialized = false;

  OpenVPN openvpn = OpenVPN();
  final info = NetworkInfo();
  final SecurelyLocalRepository _securelyLocalRepository =
      SecurelyLocalRepository();

  Future<void> init() async {
    openvpn = OpenVPN(
      onVpnStatusChanged: onVpnStatusChanged,
      onVpnStageChanged: onVpnStageChanged,
    );
    try {
      await openvpn.initialize(
        groupIdentifier: "group.com.implicit.protection",
        providerBundleIdentifier: "com.implicit.protection.VPNExtension",
        localizedDescription: "Protection App VPN",
      );
      if (kDebugMode) print('OpenVPN initialized successfully');
      isInitialized = true;
    } catch (e, stacktrace) {
      if (kDebugMode) print('Initialization error: $e');
      if (kDebugMode) print('Stacktrace: $stacktrace');
      isInitialized = false;
    }
  }

  void onVpnStatusChanged(VpnStatus? vpnStatus) {
    // if (kDebugMode) print(vpnStatus.toString());
    if (kDebugMode) print('VPN Status:  $vpnStatus');
  }

  void onVpnStageChanged(VPNStage? vpnStage, String rawStage) {
    emit(state.copyWith(stage: vpnStage));
    if (kDebugMode) print('VPN Stage:  $vpnStage');
  }

  void selectVpn(VpnModel vpn) {
    emit(state.copyWith(selectedVpn: vpn));
  }

  Future<void> getWifiIp() async {
    var ip = await info.getWifiGatewayIP();
    emit(state.copyWith(userIP: ip));
  }

  Future<void> connect() async {
    try {
      if (kDebugMode) print('Connecting to VPN...');

      var content = await rootBundle.loadString(state.selectedVpn.content!);

      if (openvpn.initialized && isInitialized) {
        if (kDebugMode) print('OpenVPN is initialized and ready to connect.');
        print(openvpn.connect(
          content,
          state.selectedVpn.vpnName ?? "",
          username: state.selectedVpn.username,
          password: state.selectedVpn.password,
          bypassPackages: [],
          certIsRequired: state.selectedVpn.certIsRequired ?? false,
        ));
        if (kDebugMode) print('VPN connect method called.');
      } else {
        if (kDebugMode) print('OpenVPN is not initialized.');
      }
    } catch (e) {
      if (kDebugMode) print('Error occurred: $e');
    }
  }

  Future<void> connectUsa() async {
    var content = await rootBundle.loadString(state.vpnUsa.content!);
    if (openvpn.initialized) {
      openvpn.connect(
        content,
        state.vpnUsa.vpnName ?? "",
        username: state.vpnUsa.username,
        password: state.vpnUsa.password,
        certIsRequired: state.vpnUsa.certIsRequired ?? false,
      );
      if (kDebugMode) print('initialize');
    }
    // print('not initialize');
  }

  void disconnect() {
    openvpn.disconnect();
    emit(state.copyWith(selectedVpn: VpnModel()));
  }

  void nextPage() {
    pageController.nextPage(
      duration: const Duration(milliseconds: 400),
      curve: Curves.easeInOut,
    );
    _securelyLocalRepository.sawSecurelyOnboarding();
    Navigation.ofPop();
    Navigation.push(page: const BrowseSecurelyView());
  }
}
