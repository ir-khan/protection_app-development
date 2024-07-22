import 'dart:io';
import 'package:app_tracking_transparency/app_tracking_transparency.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:protection_app/app/core/function/functions.dart';
import 'package:protection_app/app/core/getit/get_it.dart';
import 'package:protection_app/app/core/hive/hive.dart';
import 'package:protection_app/app/core/navigation_helper/navigation_helper.dart';
import 'package:protection_app/app/core/device_size/device_size.dart';
import 'package:protection_app/app/data/repository/breach_email_searh_repository.dart';
import 'package:protection_app/app/core/theme/app_theme.dart';
import 'package:protection_app/app/data/repository/local/isPremium_repository.dart';
import 'package:protection_app/app/presentations/breach/bloc/breach_mail_search_bloc.dart';
import 'package:protection_app/app/routes/routes.dart';
import 'package:protection_app/app/screens/change_password/cubit/change_password_cubit.dart';
import 'package:protection_app/app/screens/home_tab/browse_securely/cubit/browse_securely_cubit.dart';
import 'package:protection_app/app/screens/home_tab/photo_vault/bloc/photo_vault_bloc.dart';
import 'package:protection_app/firebase_options.dart';
import 'package:purchases_flutter/purchases_flutter.dart';

void main() async {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);
  await AppTrackingTransparency.requestTrackingAuthorization();
  setupGetIT();
  await hiveInit();
  await initPlatformState();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  runApp(const MyApp());
}

Future<void> initPlatformState() async {
  try {
    await Purchases.setLogLevel(LogLevel.debug);

    PurchasesConfiguration? configuration;
    if (Platform.isAndroid) {
      print('Platform: Android');
      configuration =
          PurchasesConfiguration('goog_HUoMPPyzbEglLuetvjqGmsyTvnA');
    } else if (Platform.isIOS) {
      print('Platform: iOS');
      configuration =
          PurchasesConfiguration('appl_yQqnAqiwifckZmYQzSroaKcYkXY');
    }

    if (configuration != null) {
      await Purchases.configure(configuration);
      print('Purchases configured');

      // Adding listener after configuration
      var result = IsPremiumRepository().getIsPremium() ?? false;
      Purchases.addCustomerInfoUpdateListener((customerInfo) {
        EntitlementInfo? entitlementInfo =
            customerInfo.entitlements.all["Premium"];
        result = entitlementInfo?.isActive ?? false;

        print('Entitlement result: $result');
      });

    } else {
      print('Purchases configuration is null');
    }
  } catch (e) {
    print('Error initializing platform state: ${e}');
  }
}

final class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
    // _setupIsPro();
  }

  // Future<void> _setupIsPro() async {
  //   var result = IsPremiumRepository().getIsPremium() ?? false;
  //   Purchases.addCustomerInfoUpdateListener((customerInfo) {
  //     EntitlementInfo? entitlementInfo =
  //         customerInfo.entitlements.all["Premium"];
  //     setState(() {
  //       result = entitlementInfo?.isActive ?? false;
  //     });
  //     print('result : $result');
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    DeviceSize().init(context);
    Functions().precache(context);
    return MediaQuery(
      data: DeviceSize.data!.copyWith(
        textScaler: const TextScaler.linear(1.0),
      ),
      child: MultiBlocProvider(
          providers: [
            BlocProvider(
              create: (_) => PhotoVaultBloc(),
            ),
            BlocProvider(
              create: (_) => BreachMailSearchBloc(
                BreachEmailSearchRepository(),
              ),
            ),
            BlocProvider(
              create: (_) => BrowseSecurelyCubit(),
            ),
            BlocProvider(
              create: (_) => ChangePasswordCubit(),
            ),
          ],
          child: MaterialApp(
            debugShowCheckedModeBanner: false,
            initialRoute: Routes.splash,
            onGenerateRoute: Routes.onGenerateRoutes,
            navigatorKey: Navigation.navigationKey,
            theme: AppTheme.theme,
          )),
    );
  }
}
