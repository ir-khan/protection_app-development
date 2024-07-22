import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:gap/gap.dart';
import 'package:protection_app/app/core/constants/colors.dart';
import 'package:protection_app/app/core/constants/strings.dart';
import 'package:protection_app/app/core/custom/custom_appbar.dart';
import 'package:protection_app/app/core/device_border/device_border.dart';
import 'package:protection_app/app/core/device_size/device_size.dart';
import 'package:protection_app/app/core/navigation_helper/navigation_helper.dart';

class DataBreachNot extends StatelessWidget {
  const DataBreachNot({super.key, required this.mail});
  final String mail;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(AppStrings.dataBreachMonitoring),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.only(left: 20.0, right: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 20,
              ),
              const Text(
                "There is no compromised account.",
                textAlign: TextAlign.start,
                style: TextStyle(
                  color: TextColors.primary,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Gap(DeviceSize.height! * 0.025),
              Text(
                "We have not found an address named $mail in any known data breach.",
                // textAlign: TextAlign.start,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  // fontWeight: FontWeight.bold,
                ),
              ),
              Gap(DeviceSize.height! * 0.55),
              Align(
                alignment: Alignment.center,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: DeviceBorder.fix.circularRadius,
                    ),
                    fixedSize: Size(DeviceSize.width! * 0.8, 50),
                  ),
                  onPressed: () {
                    // Navigation.push(page: DataBreachIn());
                    Navigation.ofPop();
                  },
                  child: const Text(
                    'Done',
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
