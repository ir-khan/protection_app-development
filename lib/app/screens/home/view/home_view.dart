import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:openvpn_flutter/openvpn_flutter.dart';
import 'package:protection_app/app/core/constants/colors.dart';
import 'package:protection_app/app/core/custom/custom_text.dart';
import 'package:protection_app/app/core/device_border/device_border.dart';
import 'package:protection_app/app/core/device_padding/device_padding.dart';
import 'package:protection_app/app/core/function/functions.dart';
import 'package:protection_app/app/core/getit/get_it.dart';
import 'package:protection_app/app/core/hive/hive.dart';
import 'package:protection_app/app/core/navigation_helper/navigation_helper.dart';
import 'package:protection_app/app/core/theme/neon_icons.dart';
import 'package:protection_app/app/data/repository/local/data_breach_monitoring_repository.dart';
import 'package:protection_app/app/data/repository/local/isPremium_repository.dart';
import 'package:protection_app/app/data/repository/local/is_true.dart';
import 'package:protection_app/app/routes/routes.dart';
import 'package:protection_app/app/screens/home/widgets/home_appbar.dart';
import 'package:protection_app/app/screens/home/widgets/home_body.dart';
import 'package:protection_app/app/screens/home_tab/browse_securely/cubit/browse_securely_cubit.dart';
import 'package:protection_app/main.dart';

final class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final IsTrueRepository _isTrueRepository = IsTrueRepository();

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final result = _isTrueRepository.getIsTrue() ?? false;

      if (!result) {
        Functions.reviewStore();
        _isTrueRepository.sawIsTrue();
      }
    });
    return Scaffold(
      appBar: homeAppBar(),
      // body: homeBody(),

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            HomeListItem(
              onTap: () {
                Navigation.pushNamed(
                    root:
                        getIt.get<IsPremiumRepository>().getIsPremium() ?? false
                            ? Routes.webProtection
                            : Routes.paywall);
              },
              title: "Web protection",
              content:
                  "Turn all of your shields for safer, more private browsing",
              icon: NeonIcons.web,
              button: BlocBuilder<BrowseSecurelyCubit, BrowseSecurelyState>(
                builder: (context, state) {
                  return ElevatedButton(
                    onPressed: () {
                      Navigation.pushNamed(
                          root:
                              getIt.get<IsPremiumRepository>().getIsPremium() ??
                                      false
                                  ? Routes.webProtection
                                  : Routes.paywall);
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: state.stage == VPNStage.connected
                          ? AppColors.secondary
                          : AppColors.primary,
                    ),
                    child: Text(
                      state.stage == VPNStage.connected
                          ? "Deactivate"
                          : 'Activate',
                      style: TextStyle(
                        color: state.stage == VPNStage.connected
                            ? AppColors.white
                            : AppColors.darkGrey,
                      ),
                    ),
                  );
                },
              ),
            ),
            HomeListItem(
              onTap: () {
                Navigation.pushNamed(
                    root:
                        // getIt.get<IsPremiumRepository>().getIsPremium() ?? false
                            // ?
                             Routes.browseSecurely
                            // : Routes.paywall
                            );
              },
              title: "Browse securely",
              content:
                  "Turn on VPN Secure Connection whenever you need to extra privacy online.",
              icon: NeonIcons.browse,
              button: BlocBuilder<BrowseSecurelyCubit, BrowseSecurelyState>(
                builder: (context, state) {
                  return ElevatedButton(
                    onPressed: () {
                      Navigation.pushNamed(
                          root:
                              getIt.get<IsPremiumRepository>().getIsPremium() ??
                                      false
                                  ? Routes.browseSecurely
                                  : Routes.paywall);
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: state.stage == VPNStage.connected
                          ? AppColors.secondary
                          : AppColors.primary,
                    ),
                    child: Text(
                      state.stage == VPNStage.connected
                          ? "Deactivate"
                          : 'Activate',
                      style: TextStyle(
                        color: state.stage == VPNStage.connected
                            ? AppColors.white
                            : AppColors.darkGrey,
                      ),
                    ),
                  );
                },
              ),
            ),
            HomeListItem(
              onTap: () {
                Navigation.pushNamed(
                    root:
                        getIt.get<IsPremiumRepository>().getIsPremium() ?? false
                            ? Routes.dataBreach2
                            : Routes.paywall);
              },
              title: "Secure your online accounts",
              content:
                  "Add your email to get real-time alerts if your passwords leak online.",
              icon: NeonIcons.secure,
              button: ElevatedButton(
                onPressed: () {
                  Navigation.pushNamed(
                      root: getIt.get<IsPremiumRepository>().getIsPremium() ??
                              false
                          ? Routes.dataBreach2
                          : Routes.paywall);
                },
                child: const Text(
                  "Check email",
                  style: TextStyle(color: AppColors.darkGrey),
                ),
              ),
            ),
            HomeListItem(
              onTap: () {
                Navigation.pushNamed(
                    root:
                        getIt.get<IsPremiumRepository>().getIsPremium() ?? false
                            ? Routes.photoVault
                            : Routes.paywall);
              },
              title: "Hide your private photos",
              content:
                  "Add your private photos to Photo Vault to keep them away from prying eyes.",
              icon: NeonIcons.photos,
              button: ElevatedButton(
                onPressed: () {
                  Navigation.pushNamed(
                      root: getIt.get<IsPremiumRepository>().getIsPremium() ??
                              false
                          ? Routes.photoVault
                          : Routes.paywall);
                },
                child: const Text(
                  'Add photos',
                  style: TextStyle(color: AppColors.darkGrey),
                ),
              ),
            ),
          ],
        ),
      ),
      // body: homeBody(),
      resizeToAvoidBottomInset: false,
    );
  }
}

class HomeListItem extends StatelessWidget {
  const HomeListItem({
    super.key,
    required this.onTap,
    required this.title,
    required this.content,
    required this.button,
    required this.icon,
  });
  final VoidCallback onTap;
  final String title;
  final String content;
  final Widget button;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          Container(
            decoration: BoxDecoration(
              color: AppColors.darkGrey,
              borderRadius: DeviceBorder.fix.circularRadius,
            ),
            height: 233,
            width: double.infinity,
            padding: DevicePadding.medium.boxSpecial,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Icon(
                  icon,
                  color: AppColors.primary,
                  size: 40,
                ),
                customTextTitle(
                  title,
                ),
                customTextContent(
                  content,
                ),
                button,
              ],
            ),
          ),
          const Gap(20),
        ],
      ),
    );
  }
}
