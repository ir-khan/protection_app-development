import 'package:flutter/material.dart';
import 'package:protection_app/app/core/constants/data.dart';
import 'package:protection_app/app/core/constants/strings.dart';
import 'package:protection_app/app/core/custom/custom_appbar.dart';
import 'package:protection_app/app/core/custom/custom_screen_box.dart';

class WebProtectionView extends StatefulWidget {
  const WebProtectionView({super.key});

  @override
  State<WebProtectionView> createState() => _WebProtectionViewState();
}

class _WebProtectionViewState extends State<WebProtectionView> {
  int index = 0;
  bool active = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(AppStrings.webProtection),
      body: customScreenBox(
        Data.webProtectionData[index].path,
        Data.webProtectionData[index].title,
        Data.webProtectionData[index].content,
        Data.webProtectionData[index].buttonName,
        Data.webProtectionData[index].activate,
        () {
          if (index < 2) {
            setState(
              () {
                index++;
              },
            );
          } else if (index == 2) {
            setState(
              () {
                index--;
              },
            );
          }
        },
      ),
    );
  }
}
