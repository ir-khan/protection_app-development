// ignore_for_file: use_build_context_synchronously

import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:protection_app/app/core/constants/colors.dart';
import 'package:protection_app/app/core/navigation_helper/navigation_helper.dart';
import 'package:protection_app/app/core/theme/neon_icons.dart';
import 'package:protection_app/app/data/models/premium/premium_model.dart';
import 'package:protection_app/app/data/repository/local/isPremium_repository.dart';
import 'package:protection_app/app/data/repository/user_repository.dart';
import 'package:protection_app/app/screens/home/view/home_view.dart';
import 'package:protection_app/app/screens/paywall/widget/paywall_get_started_button.dart';
import 'package:protection_app/app/screens/paywall/widget/paywall_list_description.dart';
import 'package:protection_app/app/screens/paywall/widget/paywall_text_button_list.dart';
import 'package:purchases_flutter/purchases_flutter.dart';
import 'package:webview_flutter/webview_flutter.dart';

class PaywallView extends StatefulWidget {
  const PaywallView({super.key});

  @override
  State<PaywallView> createState() => _PaywallViewState();
}

class _PaywallViewState extends State<PaywallView> {
  final IsPremiumRepository _isPremiumRepository = IsPremiumRepository();
  Offering? _offering;
  Package? _selectedPackage;
  Package? package;

  UserRepository userRepository = UserRepository();

  @override
  void initState() {
    super.initState();
    _getOffering();
  }

  void _getOffering() async {
    try {
      Offerings offerings = await Purchases.getOfferings();
      setState(() {
        _offering = offerings.current;
        _selectedPackage = _offering?.availablePackages.first;
        // log(_offering!.annual.toString());
      });
      // print(_offering?.availablePackages);
    } on PlatformException catch (e) {
      // Handle error
      log('hata mesaji $e');
    }
  }

  void _makePurchase() async {
    if (_selectedPackage != null ) {
      try {
        CustomerInfo purchaserInfo =
            await Purchases.purchasePackage(_selectedPackage!);
            // print(purchaserInfo);
        if (purchaserInfo.entitlements.all["Premium"]!.isActive) {
          // isPremium = true;
          await userRepository.updateProPlan(PremiumModel(
            isPremium: true,
            premiumType: _selectedPackage!.packageType.toString(),
            revenueCatId: purchaserInfo.originalAppUserId,
          ));
          // isPro = true;
          log(_selectedPackage!.packageType.toString());
          _isPremiumRepository.sawIsPremium();
          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
            content: Text('Let\'s imagine!'),
            duration: Duration(seconds: 2),
            behavior: SnackBarBehavior.floating,
          ));
          Navigation.push(page: const HomeView());
        }
      } on PlatformException catch (e) {
        var errorCode = PurchasesErrorHelper.getErrorCode(e);
        if (errorCode != PurchasesErrorCode.purchaseCancelledError) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(e.message!)),
          );
        }
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: customAppBar(AppStrings.paywall),
      body: Stack(
        children: [
          SafeArea(
            child: Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Spacer(
                    flex: 4,
                  ),
                  Image(
                    image: const AssetImage('assets/images/paywall.png'),
                    height: MediaQuery.sizeOf(context).height * 0.2,
                  ),
                  const Spacer(
                    flex: 2,
                  ),
                  const Text(
                    'Unlock All Features',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w700,
                      fontSize: 26,
                    ),
                  ),
                  const Spacer(),
                  const PaywallListDescriptions(),
                  const Spacer(
                    flex: 4,
                  ),
                  SizedBox(
                    width: MediaQuery.sizeOf(context).width * 0.65,
                    child: Text(
                      'Once the free trial ends, the app will auto-renew the subscription weekly, monthly, and yearly.',
                      style: TextStyle(
                        color: Colors.grey.shade600,
                        fontWeight: FontWeight.w400,
                        fontSize: 16,
                      ),
                    ),
                  ),
                  // const Spacer(),
                  // const PaywallButtonList(),
                  const Spacer(
                    flex: 4,
                  ),
                  _offering != null && _offering!.availablePackages.length > 1 ?
                  _buildPackageOption(
                    _offering!.availablePackages.elementAt(1),
                  ) : const SizedBox.shrink(),
                  const Spacer(),
                  _offering != null && _offering!.availablePackages.isNotEmpty ?
                  _buildPackageOption(
                    _offering!.availablePackages.elementAt(0),
                  ) : const SizedBox.shrink(),
                  const Spacer(),
                  _offering != null && _offering!.availablePackages.length > 2 ?
                  _buildPackageOption(
                    _offering!.availablePackages.elementAt(2),
                  ) : const SizedBox.shrink(),
                  const Spacer(
                    flex: 4,
                  ),
                  PaywallGetStartedButton(
                      buttonTitle: 'Get Started',
                      onTap: () {
                        _selectedPackage == null ? null : _makePurchase();
                        // log(_selectedPackage!.packageType.toString());
                      }),
                  const SizedBox(height: 20),
                  const Spacer(),
                  PaywallTextButtonList(
                    termOfUseButton: () {
                      Navigation.push(
                          page: const CustomWebViewWidget(
                        url:
                            'https://sites.google.com/neonapps.co/cloak-privacy-security/terms-of-use',
                      ));
                    },
                    restorePurchaseButton: () async {
                      try {
                        CustomerInfo? customerInfo =
                            await Purchases.restorePurchases();

                        if (customerInfo.entitlements.all.isEmpty) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text(
                                  "You have no previous purchases to restore."),
                            ),
                          );
                        } else {
                          log("Restore successful: $customerInfo");
                          await userRepository.updateProPlan(PremiumModel(
                            isPremium: true,
                            premiumType:
                                _selectedPackage!.packageType.toString(),
                            revenueCatId: customerInfo.originalAppUserId,
                          ));
                          Navigation.push(page: const HomeView());
                        }
                      } on PlatformException catch (e) {
                        log("Restore failed: ${e.message}");
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text("Restore failed: ${e.message}"),
                          ),
                        );
                      }
                    },
                    privacyPolicyButton: () {
                      Navigation.push(
                          page: const CustomWebViewWidget(
                        url:
                            'https://sites.google.com/neonapps.co/cloak-privacy-security/privacy-policy',
                      ));
                    },
                  )
                ],
              ),
            ),
          ),
          Positioned(
            top: 12,
            child: SafeArea(
              child: IconButton(
                onPressed: () => Navigation.push(page: const HomeView()),
                icon: const Icon(
                  NeonIcons.close,
                  size: 20,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPackageOption(Package package) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _selectedPackage = package;
        });
      },
      child: Container(
        width: MediaQuery.of(context).size.width * 0.8,
        height: MediaQuery.of(context).size.width * 0.15,
        decoration: BoxDecoration(
          border: Border.all(
            color: _selectedPackage == package
                ? AppColors.primary
                : AppColors.darkGrey,
            width: 2,
          ),
          color: AppColors.darkGrey,
          borderRadius: BorderRadius.circular(20.0),
        ),
        child: Padding(
          padding: const EdgeInsets.only(left: 20.0, right: 20.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                package.storeProduct.title.split(' ')[0],
                style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                    fontSize: 15),
              ),
              // Text(
              //   "${package.storeProduct.title.replaceFirst('Plan', '')} ",
              //   style: const TextStyle(
              //     color: Colors.white,
              //     fontWeight: FontWeight.w600,
              //     fontSize: 15,
              //   ),
              // ),
              Image(
                image: const AssetImage('assets/images/free_trial.png'),
                width: MediaQuery.of(context).size.width * 0.27,
              ),
              Text(
                package.storeProduct.priceString,
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                  fontSize: 15,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class CustomWebViewWidget extends StatelessWidget {
  const CustomWebViewWidget({super.key, required this.url});

  final String url;

  @override
  Widget build(BuildContext context) {
    final controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.disabled)
      ..loadRequest(Uri.parse(url));
    return Scaffold(
      appBar: AppBar(),
      body: WebViewWidget(controller: controller),
    );
  }
}
