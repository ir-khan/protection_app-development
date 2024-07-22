// ignore_for_file: public_member_api_docs, sort_constructors_first
// ignore_for_file: must_be_immutable

import 'package:equatable/equatable.dart';

class VpnModel extends Equatable {
  String? flagPath;
  String? content;
  String? vpnName;
  String? username;
  String? password;
  bool? certIsRequired;
  VpnModel({
    this.flagPath,
    this.content,
    this.vpnName,
    this.username,
    this.password,
    this.certIsRequired,
  });

  @override
  List<Object?> get props {
    return [
      flagPath,
      content,
      vpnName,
      username,
      password,
      certIsRequired,
    ];
  }
}

class VpnList {
  static VpnModel vpnUsaIos = VpnModel(
    flagPath: 'assets/flags/usa.png',
    content: 'assets/vpns/usa/free/premiusa2.vpnjantit-tcp-1194.ovpn',
    vpnName: 'Los Angeles, USA',
    username: 'neonapps',
    password: 'NeonApps2023',
    certIsRequired: true,
  );

  static VpnModel vpnUsaAndroid = VpnModel(
    flagPath: 'assets/flags/usa.png',
    content: 'assets/vpns/usa/neonapps-premiusa2.vpnjantit-udp-2500.ovpn',
    vpnName: 'Los Angeles, USA',
    username: 'neonapps',
    password: 'NeonApps2023',
    certIsRequired: true,
  );

  /// VPN [List] Android
  static List<VpnModel> vpnsAndroid = [
    /// VPN CANADA TCP ANDROID
    VpnModel(
      flagPath: 'assets/flags/canada.png',
      content: 'assets/vpns/canada/neonapps-ca1.vpnjantit-tcp-2501.ovpn',
      vpnName: 'Canada, Canada',
      username: 'neonapps',
      password: 'NeonApps2023',
      certIsRequired: true,
    ),

    /// VPN CANADA UDP ANDROID
    VpnModel(
      flagPath: 'assets/flags/canada.png',
      content: 'assets/vpns/canada/neonapps-ca1.vpnjantit-udp-2500.ovpn',
      vpnName: 'Canada, Canada',
      username: 'neonapps',
      password: 'NeonApps2023',
      certIsRequired: true,
    ),

    /// VPN ENGLAND TCP ANDROID
    VpnModel(
      flagPath: 'assets/flags/england.png',
      content: 'assets/vpns/england/neonapps-premiuk.vpnjantit-tcp-2501.ovpn',
      vpnName: 'Bexley, United Kingdom',
      username: 'neonapps',
      password: 'NeonApps2023',
      certIsRequired: true,
    ),

    /// VPN ENGLAND UDP ANDROID
    VpnModel(
      flagPath: 'assets/flags/england.png',
      content: 'assets/vpns/england/neonapps-premiuk.vpnjantit-udp-2500.ovpn',
      vpnName: 'Bexley, United Kingdom',
      username: 'neonapps',
      password: 'NeonApps2023',
      certIsRequired: true,
    ),

    /// VPN FRANCE TCP ANDROID
    VpnModel(
      flagPath: 'assets/flags/france.png',
      content: 'assets/vpns/france/neonapps-fr2.vpnjantit-tcp-2501.ovpn',
      vpnName: 'Lille, France',
      username: 'neonapps',
      password: 'NeonApps2023',
      certIsRequired: true,
    ),

    /// VPN FRANCE UDP ANDROID
    VpnModel(
      flagPath: 'assets/flags/france.png',
      content: 'assets/vpns/france/neonapps-fr2.vpnjantit-udp-2500.ovpn',
      vpnName: 'Lille, France',
      username: 'neonapps',
      password: 'NeonApps2023',
      certIsRequired: true,
    ),

    /// VPN GERMANY TCP ANDROID
    VpnModel(
      flagPath: 'assets/flags/germany.png',
      content: 'assets/vpns/germany/neonapps-gr2.vpnjantit-tcp-2501.ovpn',
      vpnName: 'Frankfurt, Germany',
      username: 'neonapps',
      password: 'NeonApps2023',
      certIsRequired: true,
    ),

    /// VPN GERMANY UDP ANDROID
    VpnModel(
      flagPath: 'assets/flags/germany.png',
      content: 'assets/vpns/germany/neonapps-gr2.vpnjantit-udp-2500.ovpn',
      vpnName: 'Frankfurt, Germany',
      username: 'neonapps',
      password: 'NeonApps2023',
      certIsRequired: true,
    ),

    /// VPN ITALY TCP ANDROID
    VpnModel(
      flagPath: 'assets/flags/italy.png',
      content: 'assets/vpns/italy/neonapps-it2.vpnjantit-tcp-2501.ovpn',
      vpnName: 'Palermo, Italy',
      username: 'neonapps',
      password: 'NeonApps2023',
      certIsRequired: true,
    ),

    /// VPN ITALY UDP ANDROID
    VpnModel(
      flagPath: 'assets/flags/italy.png',
      content: 'assets/vpns/italy/neonapps-it2.vpnjantit-udp-2500.ovpn',
      vpnName: 'Palermo, Italy',
      username: 'neonapps',
      password: 'NeonApps2023',
      certIsRequired: true,
    ),

    /// VPN TURKEY TCP ANDROID
    VpnModel(
      flagPath: 'assets/flags/turkey.png',
      content: 'assets/vpns/turkey/neonapps-tr4.vpnjantit-tcp-2501.ovpn',
      vpnName: 'Gemlik, Turkey',
      username: 'neonapps',
      password: 'NeonApps2023',
      certIsRequired: true,
    ),

    /// VPN TURKEY UDP ANDROID
    VpnModel(
      flagPath: 'assets/flags/turkey.png',
      content: 'assets/vpns/turkey/neonapps-tr4.vpnjantit-udp-2500.ovpn',
      vpnName: 'Gemlik, Turkey',
      username: 'neonapps',
      password: 'NeonApps2023',
      certIsRequired: true,
    ),

    /// VPN USA TCP ANDROID
    VpnModel(
      flagPath: 'assets/flags/usa.png',
      content: 'assets/vpns/usa/neonapps-premiusa2.vpnjantit-tcp-2501.ovpn',
      vpnName: 'Los Angeles, USA',
      username: 'neonapps',
      password: 'NeonApps2023',
      certIsRequired: true,
    ),

    /// VPN USA UDP ANDROID
    VpnModel(
      flagPath: 'assets/flags/usa.png',
      content: 'assets/vpns/usa/neonapps-premiusa2.vpnjantit-udp-2500.ovpn',
      vpnName: 'Los Angeles, USA',
      username: 'neonapps',
      password: 'NeonApps2023',
      certIsRequired: true,
    ),
  ];

  /// VPN [List] IOS
  static List<VpnModel> vpnsIos = [
    /// VPN CANADA TCP IOS
    VpnModel(
      flagPath: 'assets/flags/canada.png',
      content: 'assets/vpns/canada/free/ca1.vpnjantit-tcp-1194.ovpn',
      vpnName: 'Montreal, Canada',
      username: 'neonapps',
      password: 'NeonApps2023',
      certIsRequired: true,
    ),

    /// VPN CANADA UDP IOS
    VpnModel(
      flagPath: 'assets/flags/canada.png',
      content: 'assets/vpns/canada/free/ca1.vpnjantit-udp-1194.ovpn',
      vpnName: 'Montreal, Canada',
      username: 'neonapps',
      password: 'NeonApps2023',
      certIsRequired: true,
    ),

    /// VPN ENGLAND TCP IOS
    VpnModel(
      flagPath: 'assets/flags/england.png',
      content: 'assets/vpns/england/free/premiuk.vpnjantit-tcp-1194.ovpn',
      vpnName: 'Bexley, United Kingdom',
      username: 'neonapps',
      password: 'NeonApps2023',
      certIsRequired: true,
    ),

    /// VPN ENGLAND UDP IOS
    VpnModel(
      flagPath: 'assets/flags/england.png',
      content: 'assets/vpns/england/free/premiuk.vpnjantit-udp-1194.ovpn',
      vpnName: 'Bexley, United Kingdom',
      username: 'neonapps',
      password: 'NeonApps2023',
      certIsRequired: true,
    ),

    /// VPN FRANCE TCP IOS
    VpnModel(
      flagPath: 'assets/flags/france.png',
      content: 'assets/vpns/france/free/fr2.vpnjantit-tcp-1194.ovpn',
      vpnName: 'Lille, France',
      username: 'neonapps',
      password: 'NeonApps2023',
      certIsRequired: true,
    ),

    /// VPN FRANCE UDP IOS
    VpnModel(
      flagPath: 'assets/flags/france.png',
      content: 'assets/vpns/france/free/fr2.vpnjantit-udp-1194.ovpn',
      vpnName: 'Lille, France',
      username: 'neonapps',
      password: 'NeonApps2023',
      certIsRequired: true,
    ),

    /// VPN GERMANY TCP IOS
    VpnModel(
      flagPath: 'assets/flags/germany.png',
      content: 'assets/vpns/germany/free/gr2.vpnjantit-tcp-1194.ovpn',
      vpnName: 'Frankfurt, Germany',
      username: 'neonapps',
      password: 'NeonApps2023',
      certIsRequired: true,
    ),

    /// VPN GERMANY UDP IOS
    VpnModel(
      flagPath: 'assets/flags/germany.png',
      content: 'assets/vpns/germany/free/gr2.vpnjantit-udp-1194.ovpn',
      vpnName: 'Frankfurt, Germany',
      username: 'neonapps',
      password: 'NeonApps2023',
      certIsRequired: true,
    ),

    /// VPN ITALY TCP IOS
    VpnModel(
      flagPath: 'assets/flags/italy.png',
      content: 'assets/vpns/italy/free/it2.vpnjantit-tcp-1194.ovpn',
      vpnName: 'Palermo, Italy',
      username: 'neonapps',
      password: 'NeonApps2023',
      certIsRequired: true,
    ),

    /// VPN ITALY UDP IOS
    VpnModel(
      flagPath: 'assets/flags/italy.png',
      content: 'assets/vpns/italy/free/it2.vpnjantit-udp-1194.ovpn',
      vpnName: 'Palermo, Italy',
      username: 'neonapps',
      password: 'NeonApps2023',
      certIsRequired: true,
    ),

    /// VPN TURKEY TCP IOS
    VpnModel(
      flagPath: 'assets/flags/turkey.png',
      content: 'assets/vpns/turkey/free/tr4.vpnjantit-tcp-1194.ovpn',
      vpnName: 'Gemlik, Turkey',
      username: 'neonapps',
      password: 'NeonApps2023',
      certIsRequired: true,
    ),

    /// VPN TURKEY UDP IOS
    VpnModel(
      flagPath: 'assets/flags/turkey.png',
      content: 'assets/vpns/turkey/free/tr4.vpnjantit-udp-1194.ovpn',
      vpnName: 'Gemlik, Turkey',
      username: 'neonapps',
      password: 'NeonApps2023',
      certIsRequired: true,
    ),

    /// VPN USA TCP IOS

    VpnModel(
      flagPath: 'assets/flags/usa.png',
      content: 'assets/vpns/usa/free/premiusa2.vpnjantit-tcp-1194.ovpn',
      vpnName: 'Los Angeles, USA',
      username: 'neonapps',
      password: 'NeonApps2023',
      certIsRequired: true,
    ),

    /// VPN USA UDP IOS

    VpnModel(
      flagPath: 'assets/flags/usa.png',
      content: 'assets/vpns/usa/free/premiusa2.vpnjantit-udp-1194.ovpn',
      vpnName: 'Los Angeles, USA',
      username: 'neonapps',
      password: 'NeonApps2023',
      certIsRequired: true,
    ),
  ];
}
