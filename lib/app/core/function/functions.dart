import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:in_app_review/in_app_review.dart';
import 'package:protection_app/app/core/constants/strings.dart';
import 'package:protection_app/app/data/repository/local/is_true.dart';
import 'package:protection_app/app/screens/home_tab/photo_vault/widget/cupertino_action_sheet_container.dart';

final class Functions {
  static final IsTrueRepository _isTrueRepository = IsTrueRepository();

  ///Precache function for assets
  void precache(BuildContext context) {
    for (String path in AssetsPath.cacheList) {
      precacheImage(AssetImage(path), context);
    }
    for (String path in AssetsPath.onboardingList) {
      precacheImage(AssetImage(path), context);
    }
  }

  static InAppReview inAppReview = InAppReview.instance;
  static Future<void> reviewStore() async {
    if (await inAppReview.isAvailable()) {
      inAppReview.requestReview();

      // inAppReview.openStoreListing(
      //     appStoreId: 'com.implicit.protection',
      //     microsoftStoreId: 'com.implicit.protection');
    }
  }

  static void showReviewMessage(BuildContext context, bool barrierDiss) {
    showCupertinoModalPopup<void>(
      barrierDismissible: barrierDiss,
      context: context,
      builder: (BuildContext context) => CupertinoAlertDialog(
        title: const Text('Alert'),
        content: const Text(
            'Cloak makes sure you’re safe and protected! We’d love it if you left us a review.'),
        actions: <CupertinoDialogAction>[
          CupertinoDialogAction(
            isDefaultAction: true,
            onPressed: () {
              Navigator.pop(context);
              _isTrueRepository.sawIsTrue();
            },
            child: const Text('No'),
          ),
          CupertinoDialogAction(
            isDestructiveAction: true,
            onPressed: () {
              reviewStore();
              _isTrueRepository.sawIsTrue();
            },
            child: const Text('Yes'),
          ),
        ],
      ),
    );
  }

  static Future showOptions(
    BuildContext context, {
    required VoidCallback onPressedLibrary,
    required VoidCallback onPressedCamera,
    required VoidCallback onCancel,
  }) async {
    return showCupertinoModalPopup(
      context: context,
      builder: (BuildContext context) => CupertinoActionSheet(
        actions: [
          CupertinoActionSheetContainer(
            text: 'Library',
            onPressed: onPressedLibrary,
            fontWeight: FontWeight.normal,
          ),
          CupertinoActionSheetContainer(
            text: 'Camera',
            onPressed: onPressedCamera,
            fontWeight: FontWeight.normal,
          ),
        ],
        cancelButton: Container(
          decoration: BoxDecoration(
            color: const Color(0xFF181818),
            borderRadius: BorderRadius.circular(10),
          ),
          child: CupertinoActionSheetAction(
            onPressed: onCancel,
            child: const Text(
              'Cancel',
              style: TextStyle(
                color: Colors.blue,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
