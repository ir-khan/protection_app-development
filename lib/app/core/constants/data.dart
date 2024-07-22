import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:openvpn_flutter/openvpn_flutter.dart';
import 'package:protection_app/app/core/constants/strings.dart';
import 'package:protection_app/app/core/function/functions.dart';
import 'package:protection_app/app/core/getit/get_it.dart';
import 'package:protection_app/app/core/navigation_helper/navigation_helper.dart';
import 'package:protection_app/app/core/theme/neon_icons.dart';
import 'package:protection_app/app/data/models/box_model.dart';
import 'package:protection_app/app/data/models/screen_box_model.dart';
import 'package:protection_app/app/data/models/tile_model.dart';
import 'package:protection_app/app/routes/routes.dart';
import 'package:protection_app/app/screens/change_password/view/change_password_view.dart';
import 'package:protection_app/app/screens/home_tab/browse_securely/cubit/browse_securely_cubit.dart';
import 'package:protection_app/app/screens/paywall/view/paywall_view.dart';
import 'package:purchases_flutter/models/customer_info_wrapper.dart';
import 'package:purchases_flutter/purchases_flutter.dart';

final class Data {
  ///Settings screen's items.

  static List<TileModel> settingsData = [
    TileModel(
      icon: NeonIcons.settings,
      title: "Account Settings",
      function: () => Navigation.pushNamed(root: Routes.accountSettings),
    ),
    TileModel(
      icon: NeonIcons.help,
      title: "Support and Help",
      function: () => Navigation.pushNamed(root: Routes.supportAndHelp),
    ),
    TileModel(
      icon: NeonIcons.about,
      title: "About",
      function: () => Navigation.pushNamed(root: Routes.about),
    ),
  ];

  ///Account screen's item.
  static List<TileModel> accountSettingsData = [
    TileModel(
      icon: NeonIcons.lock,
      title: "Change Access Code",
      function: () {
        Navigation.push(page: const ChangePasswordView());
      },
    ),
  ];

  ///Support and Help screen's items.
  static List<TileModel> supportAndHelpData = [
    // TileModel(
    //   icon: NeonIcons.contact,
    //   title: "Contact Support",
    //   function: () {},
    // ),
    TileModel(
      icon: NeonIcons.rate,
      title: "Rate Us",
      function: () {
        Functions.reviewStore();
      },
    ),
  ];

  ///About screen's items.
  static List<TileModel> aboutData = [
    TileModel(
      icon: NeonIcons.terms,
      title: "Terms of Use",
      function: () {
        Navigation.push(
            page: const CustomWebViewWidget(
          url:
              'https://sites.google.com/neonapps.co/cloak-privacy-security/terms-of-use',
        ));
      },
    ),
    TileModel(
      icon: NeonIcons.web,
      title: "Privacy Policy",
      function: () {
        Navigation.push(
            page: const CustomWebViewWidget(
          url:
              'https://sites.google.com/neonapps.co/cloak-privacy-security/privacy-policy',
        ));
      },
    ),
    TileModel(
      icon: NeonIcons.restore,
      title: "Restore Purchase",
      function: () async {
        try {
          CustomerInfo? customerInfo = await Purchases.restorePurchases();

          if (customerInfo.entitlements.all.isEmpty) {
            // ScaffoldMessenger.of().showSnackBar(
            //   const SnackBar(
            //     content: Text("You have no previous purchases to restore."),
            //   ),
            // );
          } else {
            print("Restore successful: $customerInfo");
          }
        } on PlatformException catch (e) {
          print("Restore failed: ${e.message}");
          // ScaffoldMessenger.of(context).showSnackBar(
          //   SnackBar(
          //     content: Text("Restore failed: ${e.message}"),
          //   ),
          // );
        }
      },
    ),
  ];

  ///Home screen's items.
  static List<BoxModel> homeData = [
    BoxModel(
      icon: NeonIcons.web,
      title: "Web protection",
      content: "Turn all of your shields for safer, more private browsing.",
      function: () {},
      route: Routes.webProtection,
      buttonTitle:
          getIt.get<BrowseSecurelyCubit>().state.stage == VPNStage.connected
              ? 'Active'
              : "Deactive",
    ),
    BoxModel(
      icon: NeonIcons.browse,
      title: "Browse securely",
      content:
          "Turn on VPN Secure Connection whenever you need to extra privacy online.",
      function: () {},
      route: Routes.browseSecurely,
      buttonTitle:
          getIt.get<BrowseSecurelyCubit>().state.stage == VPNStage.connected
              ? 'Active'
              : 'Deactive',
    ),
    // BoxModel(
    //   icon: NeonIcons.device,
    //   title: "Device password scan",
    //   content:
    //       "It checks whether you have a screen unlock password for the security of your phone.",
    //   function: () {},
    //   route: "",
    //   buttonTitle: 'Active',
    // ),
    BoxModel(
      icon: NeonIcons.secure,
      title: "Secure your online accounts",
      content:
          "Add your email to get real-time alerts if your passwords leak online.",
      function: () {},
      route: Routes.dataBreach2,
      buttonTitle: 'Add email',
    ),
    BoxModel(
      icon: NeonIcons.photos,
      title: "Hide your private photos",
      content:
          "Add your private photos to Photo Vault to keep them away from prying eyes.",
      function: () {},
      route: Routes.photoVault,
      buttonTitle: 'Add photos',
    ),
  ];

  ///Web Protection screen's items.
  static List<ScreenBoxModel> webProtectionData = [
    ScreenBoxModel(
      path: AssetsPath.webProtection,
      buttonName: AppStrings.next,
      title: "Make sure that harmful websites do not cause you any damage.",
      content:
          "As you browse the internet, we will scan websites and block unsafe ones. It's that easy to protect yourself from malware.",
      activate: false,
      function: (context) {},
    ),
    ScreenBoxModel(
      path: AssetsPath.enable,
      buttonName: AppStrings.activate,
      title: "Enable Web Protection",
      content:
          "Find leaked passwords and re-secure any accounts compromised in a data breach",
      activate: false,
      function: (context) {},
    ),
    ScreenBoxModel(
      path: AssetsPath.webProtection,
      buttonName: AppStrings.disable,
      title: "Your browsing is protected",
      content:
          "Web protection won't slow down your phone, we recommend keeping it on to stay safe at all times.",
      activate: true,
      function: (context) {},
    ),
  ];

  ///Browse Securely screen's items.
  static List<ScreenBoxModel> browseSecurelyData = [
    ScreenBoxModel(
      path: AssetsPath.browseSecurely,
      buttonName: AppStrings.next,
      title: "Ensure your browsing remains private with VPN Secure Connection.",
      content:
          "A VPN creates a secure, private tunnel between your phone and the internet, making data interception highly difficult.",
      activate: false,
      function: (context) {},
    ),
    ScreenBoxModel(
      path: AssetsPath.enable,
      buttonName: AppStrings.activate,
      title: "Enable VPN Secure Connection",
      content: "Utilize your new VPN for confident banking and shopping.",
      activate: false,
      function: (context) {},
    ),
    ScreenBoxModel(
      path: AssetsPath.browseSecurely,
      buttonName: AppStrings.disable,
      title: "VPN Secure Connection is active",
      content:
          "Enjoy enhanced privacy and a secure connection for your banking and shopping activities.",
      activate: true,
      function: (context) {},
    ),
  ];

  ///Vault screen's items.
  static List<ScreenBoxModel> photoVaultData = [
    ScreenBoxModel(
      path: AssetsPath.photoVaultOne,
      buttonName: AppStrings.next,
      title: "Keep your private photos safe in Photo Vault",
      content:
          "The photo vault is a secure, encrypted folder on your phone. Your photos never leave your device and no one can see them without a password.",
      activate: false,
      function: (context) {},
    ),
    ScreenBoxModel(
      path: AssetsPath.photoVaultTwo,
      buttonName: AppStrings.activate,
      title: "Important Information",
      content:
          "If you uninstall the application, your photos in the photo vault will be gone forever. So don't forget to import your photos before deleting the app.",
      activate: false,
      function: (context) {},
    ),
    ScreenBoxModel(
      path: "",
      title: "Create access code",
      content: "vault",
      buttonName: "",
      activate: false,
      function: (context) {},
    ),
    ScreenBoxModel(
      path: "vault",
      title: "Confirm access code",
      content: "",
      buttonName: "",
      activate: false,
      function: (context) {},
    ),
    ScreenBoxModel(
      path: "",
      title: "Enter access code",
      content: "vault",
      buttonName: "",
      activate: false,
      function: (context) {},
    ),
    ScreenBoxModel(
      path: AssetsPath.photoVaultOne,
      buttonName: AppStrings.addPhotos,
      title: "Nothing to see here yet",
      content: "Tap to Add Photos button to move photos to the Photo Vault.",
      activate: false,
      function: (context) async {
        await Functions.showOptions(
          context,
          onPressedLibrary: () {},
          onPressedCamera: () {},
          onCancel: () {},
        );
      },
    ),
  ];

  ///Data Breach screen's items.
  static List<ScreenBoxModel> dataBreachData = [
    ScreenBoxModel(
      path: AssetsPath.dataBreach,
      buttonName: AppStrings.next,
      title: "Learn whether a password has been compromised.",
      content:
          "Reusing passwords raises breach risk; we'll check for known breaches and notify if your email's linked accounts are compromised.",
      activate: false,
      function: (context) {},
    ),
    ScreenBoxModel(
      path: "",
      buttonName: AppStrings.checkDataBreach,
      title: "What is your email?",
      content:
          "We need the email you use for your online accounts so we can check for data breaches.",
      activate: false,
      function: (context) {},
    ),
    ScreenBoxModel(
      path: "",
      buttonName: AppStrings.done,
      title: "There is no compromised account.",
      content:
          "We have not found an address named ezgi@neonapps.co  in any known data breach.",
      activate: true,
      function: (context) {},
    ),
    ScreenBoxModel(
      path: "",
      buttonName: AppStrings.done,
      title: "2 compromised accounts",
      content:
          "To secure a compromised account, you should change the password immediately.",
      activate: true,
      function: (context) {},
    ),
  ];

  ///Onboarding screen's items.
  static List<ScreenBoxModel> onboarding = [
    ScreenBoxModel(
      path: AssetsPath.onboarding1,
      buttonName: AppStrings.getStarted,
      title: "Welcome to CLOAK",
      content:
          "Protect device, browse safely on public Wi-Fi, control online accounts.",
      activate: true,
      function: (context) {},
    ),
    ScreenBoxModel(
      path: AssetsPath.onboarding2,
      buttonName: AppStrings.continueText,
      title: "Be more private from everywhere",
      content:
          "Make any network connection safer and more private by turning on your built-in VPN.",
      activate: false,
      function: (context) {},
    ),
    ScreenBoxModel(
      path: AssetsPath.onboarding3,
      buttonName: AppStrings.continueText,
      title: "There's only you here, let’s keep it that way",
      content:
          "Find leaked passwords and re-secure any accounts compromised in a data breach",
      activate: false,
      function: (context) {},
    ),
    ScreenBoxModel(
      path: AssetsPath.onboarding4,
      buttonName: AppStrings.continueText,
      title: "Maintain the privacy of your personal photos",
      content:
          "Protect your most sensitive photos using a PIN for exclusive access.",
      activate: false,
      function: (context) {},
    ),
  ];
}
