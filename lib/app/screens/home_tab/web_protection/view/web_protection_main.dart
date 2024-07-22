import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:protection_app/app/core/constants/colors.dart';
import 'package:protection_app/app/core/constants/strings.dart';
import 'package:protection_app/app/core/navigation_helper/navigation_helper.dart';
import 'package:protection_app/app/screens/home_tab/web_protection/view/web_protection_activate.dart';

class WebProtectionMain extends StatelessWidget {
  const WebProtectionMain({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          AppStrings.webProtection,
          textAlign: TextAlign.center,
          style: TextStyle(
            fontWeight: FontWeight.w700,
            fontSize: 16,
            color: Color(0xffF9F9F9),
          ),
        ),
        leading: IconButton(
          onPressed: () => Navigation.ofPop(),
          icon: const Icon(
            Icons.close,
            size: 32,
            color: Color(0xffF9F9F9),
          ),
        ),
      ),
      body: SafeArea(
        child: Column(
          children: [
            const Image(
              image: AssetImage(
                AssetsPath.webProtection,
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              'Make sure that harmful websites do not cause you any damage.',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: TextColors.white,
                fontSize: 24,
                fontWeight: FontWeight.w700,
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              'As you browse the internet, we will scan websites and block unsafe ones. It\'s that easy to protect yourself from malware.',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: TextColors.white,
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            ),
            const Spacer(),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18)),
                fixedSize: Size(MediaQuery.of(context).size.width * 0.8, 60),
              ),
              onPressed: () {
                Navigation.push(page: const WebProtectionActivate());
              },
              child: const Text(
                'Next',
                style: TextStyle(
                  color: TextColors.black,
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
