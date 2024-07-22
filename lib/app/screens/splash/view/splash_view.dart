import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:lottie/lottie.dart';
import 'package:protection_app/app/core/constants/strings.dart';
import 'package:protection_app/app/core/device/device_info_service.dart';
import 'package:protection_app/app/core/getit/get_it.dart';
import 'package:protection_app/app/core/navigation_helper/navigation_helper.dart';
import 'package:protection_app/app/data/models/premium/premium_model.dart';
import 'package:protection_app/app/data/models/user/user_model.dart';
import 'package:protection_app/app/data/repository/auth_repository.dart';
import 'package:protection_app/app/data/repository/local/app_onboarding_repository.dart';
import 'package:protection_app/app/data/repository/local/isPremium_repository.dart';
import 'package:protection_app/app/data/repository/user_repository.dart';
import 'package:protection_app/app/routes/routes.dart';
import 'package:protection_app/app/screens/home_tab/browse_securely/cubit/browse_securely_cubit.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> with TickerProviderStateMixin {
  // late AnimationController _controller;

  @override
  void initState() {
    deleteNativeSplash();
    // _controller = AnimationController(
    //   vsync: this,
    //   duration: const Duration(seconds: 3),
    // );
    // _controller.addStatusListener(
    //   (status) {
    //     if (status == AnimationStatus.completed) {
    //       var result = AppOnboardingRepository().getAppOnboarding() ?? false;
    //       if (!result) {
    //         Navigation.pushNamed(root: Routes.onboarding);
    //       } else {
    //         Navigation.pushNamed(root: Routes.home);
    //       }
    //     }
    //   },
    // );
    // _controller.forward();
    super.initState();

    context.read<BrowseSecurelyCubit>().init();
    init();
  }

  Future<void> deleteNativeSplash() async {
    await Future.delayed(
      const Duration(milliseconds: 50),
    );
    FlutterNativeSplash.remove();
  }

  Future<void> init() async {
    AuthRepository authRepository = AuthRepository();
    UserRepository userRepository = UserRepository();
    var onboarding = AppOnboardingRepository().getAppOnboarding() ?? false;
    var deviceId = await DeviceInfoService().getDeviceId();
    var dataResult = await userRepository.getByDeviceId(deviceId!);
    if (dataResult.success) {
      if (onboarding) {
        Navigation.pushNamed(
            root: getIt.get<IsPremiumRepository>().getIsPremium() ?? false
                ? Routes.home
                : Routes.paywall);
        print(getIt.get<IsPremiumRepository>().getIsPremium() ?? false);
      } else {
        Navigation.pushNamed(root: Routes.onboarding);
      }
    } else {
      var user = await authRepository.anonymousSign();

      var result = await userRepository.createUser(
        UserModel(
          id: user!.uid,
          deviceId: deviceId,
          premium: PremiumModel(
            isPremium: false,
            premiumType: '',
            revenueCatId: '',
          ),
        ),
      );
      if (result.success) {
        Navigation.pushNamed(root: Routes.onboarding);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Lottie.asset(
          AssetsPath.splashLottie,
        ),
      ),
    );
  }
}
