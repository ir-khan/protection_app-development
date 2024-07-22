import 'package:flutter/material.dart';
import 'package:protection_app/app/core/custom/custom_error_page.dart';
import 'package:protection_app/app/data/repository/local/data_breach_monitoring_repository.dart';
import 'package:protection_app/app/data/repository/local/vault_local_repository.dart';
import 'package:protection_app/app/data/repository/local/local_securaly_repository.dart';
import 'package:protection_app/app/screens/home/view/home_view.dart';
import 'package:protection_app/app/screens/home_tab/browse_securely/view/browse_securely_onboarding_view.dart';
import 'package:protection_app/app/screens/home_tab/browse_securely/view/browse_securely_view.dart';
import 'package:protection_app/app/screens/home_tab/data_breach/view/data_breach.dart';
import 'package:protection_app/app/screens/home_tab/data_breach/view/data_breach_email.dart';
import 'package:protection_app/app/screens/home_tab/data_breach/view/data_breach_view.dart';
import 'package:protection_app/app/screens/home_tab/photo_vault/view/password_view.dart';
import 'package:protection_app/app/screens/home_tab/photo_vault/view/photo_vault_selected_view.dart';
import 'package:protection_app/app/screens/home_tab/photo_vault/view/vault_onboarding_view.dart';
import 'package:protection_app/app/screens/home_tab/photo_vault/view/vault_view.dart';
import 'package:protection_app/app/screens/home_tab/web_protection/view/web_protection_main.dart';
import 'package:protection_app/app/screens/home_tab/web_protection/view/web_protection_view.dart';
import 'package:protection_app/app/screens/onboarding/view/onboarding_view.dart';
import 'package:protection_app/app/screens/paywall/view/paywall_view.dart';
import 'package:protection_app/app/screens/settings/view/settings_view.dart';
import 'package:protection_app/app/screens/settings_tab/about/view/about_view.dart';
import 'package:protection_app/app/screens/settings_tab/account_settings/view/account_settings_view.dart';
import 'package:protection_app/app/screens/settings_tab/support_and_help/view/supports_and_help_view.dart';
import 'package:protection_app/app/screens/splash/view/splash_view.dart';

final class Routes {
  Routes._();

  static const demoBreach = '/demo';
  static const home = '/home';
  static const splash = '/splash';
  static const settings = '/settings';
  static const about = '/about';
  static const onboarding = '/onboarding';
  static const accountSettings = '/accountSettings';
  static const supportAndHelp = '/supportAndHelp';
  static const webProtection = '/webProtection';
  static const browseSecurely = '/browseSecurely';
  static const photoVault = '/photoVault';
  static const vaultPassword = '/vaultPassword';
  static const dataBreach = '/dataBreach';
  static const dataBreach2 = '/dataBreach2';
  static const paywall = '/paywall';
  static const vault = '/vault';
  static const vpnList = '/vpnList';
  static const imageSelectPage = '/imageSelectPage';

  static Route<dynamic> onGenerateRoutes(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      // case demoBreach:
      //   return _materialPageRoute(const BreachDemo());
      case home:
        return _materialPageRoute(const HomeView());
      case splash:
        return _materialPageRoute(const SplashView());
      case settings:
        return _materialPageRoute(const SettingsView());
      case about:
        return _materialPageRoute(const AboutView());
      case onboarding:
        return _materialPageRoute(const OnboardingView());
      case accountSettings:
        return _materialPageRoute(const AccountSettingsView());
      case supportAndHelp:
        return _materialPageRoute(const SupportAndHelpView());
      case webProtection:
        return _materialPageRoute(const WebProtectionMain());
      case browseSecurely:
        var result = SecurelyLocalRepository().getSecurelyOnboarding() ?? false;
        if (!result) {
          return _materialPageRoute(const BrowseSecurelyOnboardingView());
        } else {
          return _materialPageRoute(const BrowseSecurelyView());
        }
      case photoVault:
        var result = VaultLocalRepository().getVaultOnboarding() ?? false;
        if (!result) {
          return _materialPageRoute(const VaultOnboardingView());
        } else {
          return _materialPageRoute(const PasswordView());
        }
      case dataBreach:
        return _materialPageRoute(const DataBreachView());
      case dataBreach2:
        var result =
            DataBreachMonitoringRepository().getDataBreachOnBoarding() ?? false;
        if (!result) {
          return _materialPageRoute(const DataBreach());
        } else {
          return _materialPageRoute(const DataBreachEmail());
        }
      case paywall:
        return _materialPageRoute(const PaywallView());
      case vault:
        return _materialPageRoute(const VaultView());
      case imageSelectPage:
        return _materialPageRoute(const PhotoVaultSelectedView());
      default:
        return _materialPageRoute(
          customErrorPage(),
        );
    }
  }

  static MaterialPageRoute<dynamic> _materialPageRoute(Widget page) =>
      MaterialPageRoute(builder: (context) => page);
}
