import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:protection_app/app/core/constants/colors.dart';
import 'package:protection_app/app/core/custom/custom_text.dart';
import 'package:protection_app/app/core/device_border/device_border.dart';
import 'package:protection_app/app/core/device_padding/device_padding.dart';
import 'package:protection_app/app/screens/home_tab/browse_securely/cubit/browse_securely_cubit.dart';

class VpnListView extends StatelessWidget {
  const VpnListView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // appBar: customAppBar(AppStrings.serverLocations),
        backgroundColor: Colors.transparent,
        body: BlocBuilder<BrowseSecurelyCubit, BrowseSecurelyState>(
          builder: (context, state) {
            var cubit = context.read<BrowseSecurelyCubit>();
            return ListView.separated(
              // padding: const EdgeInsets.all(24),
              itemBuilder: (context, index) {
                var vpn = state.vpns[index];
                return ListTile(
                  selected: false,
                  contentPadding: DevicePadding.small.symetricHorizontalx2,
                  shape: RoundedRectangleBorder(
                    side: state.selectedVpn != vpn
                        ? BorderSide.none
                        : const BorderSide(
                            color: Color.fromARGB(182, 16, 229, 193),
                          ),
                    borderRadius: DeviceBorder.fix.circularRadius,
                  ),
                  tileColor: AppColors.darkGrey,
                  leading: CircleAvatar(
                    backgroundImage: AssetImage(vpn.flagPath!),
                  ),
                  title: customTextContentTitle(vpn.vpnName!),
                  onTap: () {
                    cubit.selectVpn(vpn);
                  },
                );
              },
              separatorBuilder: (context, index) => const SizedBox(height: 14),
              itemCount: state.vpns.length,
            );
          },
        ));
  }
}

Widget dummyData() => Column(
      children: [
        ListTile(
          selected: false,
          contentPadding: DevicePadding.small.symetricHorizontalx2,
          shape: DeviceBorder.fix.circularBorder,
          tileColor: AppColors.darkGrey,
          leading: const CircleAvatar(
            backgroundImage: NetworkImage(
              "https://media.istockphoto.com/id/1144879597/tr/vektör/türkiye-kare-bayrağı-simgesi.jpg?s=612x612&w=0&k=20&c=6ycOo2BEMYlE2d9PmRq_ovviOd1XBxHkuqUEvo-kTnc=",
            ),
          ),
          title: customTextContentTitle("South Africa, Johannesburg"),
        ),
        const Gap(15),
      ],
    );

Widget dummyDataSelected() => Column(
      children: [
        ListTile(
          selectedColor: Colors.blue,
          contentPadding: DevicePadding.small.symetricHorizontalx2,
          shape: RoundedRectangleBorder(
            side: const BorderSide(
              color: Color.fromARGB(182, 16, 229, 193),
            ),
            borderRadius: DeviceBorder.fix.circularRadius,
          ),
          tileColor: AppColors.darkGrey,
          leading: const CircleAvatar(
            backgroundImage: NetworkImage(
              "https://media.istockphoto.com/id/1144879597/tr/vektör/türkiye-kare-bayrağı-simgesi.jpg?s=612x612&w=0&k=20&c=6ycOo2BEMYlE2d9PmRq_ovviOd1XBxHkuqUEvo-kTnc=",
            ),
          ),
          title: customTextContentTitle("South Africa, Johannesburg"),
        ),
        const Gap(15),
      ],
    );
