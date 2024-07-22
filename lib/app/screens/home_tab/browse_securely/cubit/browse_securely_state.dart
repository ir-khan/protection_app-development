// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'browse_securely_cubit.dart';

class BrowseSecurelyState extends Equatable {
  final List<VpnModel> vpns;
  final VpnModel selectedVpn;
  final VPNStage stage;
  final String userIP;
  final VpnModel vpnUsa;

  const BrowseSecurelyState({
    required this.vpns,
    required this.selectedVpn,
    required this.stage,
    required this.userIP,
    required this.vpnUsa,
  });

  BrowseSecurelyState copyWith({
    List<VpnModel>? vpns,
    VPNStage? stage,
    VpnModel? selectedVpn,
    String? userIP,
    VpnModel? vpnUsa,
  }) {
    return BrowseSecurelyState(
      vpns: vpns ?? this.vpns,
      stage: stage ?? this.stage,
      selectedVpn: selectedVpn ?? this.selectedVpn,
      userIP: userIP ?? this.userIP,
      vpnUsa: vpnUsa ?? this.vpnUsa,
    );
  }

  @override
  List<Object> get props => [
        vpns,
        stage,
        selectedVpn,
        userIP,
        vpnUsa,
      ];
}
