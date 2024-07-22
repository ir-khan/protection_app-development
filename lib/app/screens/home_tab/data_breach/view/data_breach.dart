import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:gap/gap.dart';
import 'package:protection_app/app/core/constants/strings.dart';
import 'package:protection_app/app/core/custom/custom_appbar.dart';
import 'package:protection_app/app/core/device_border/device_border.dart';
import 'package:protection_app/app/core/device_size/device_size.dart';
import 'package:protection_app/app/core/navigation_helper/navigation_helper.dart';
import 'package:protection_app/app/data/repository/local/data_breach_monitoring_repository.dart';
import 'package:protection_app/app/screens/home_tab/data_breach/view/data_breach_email.dart';

class DataBreach extends StatelessWidget {
  const DataBreach({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final DataBreachMonitoringRepository _dataBreachMonitoringRepository =
        DataBreachMonitoringRepository();
    return Scaffold(
      appBar: customAppBar(AppStrings.dataBreachMonitoring),
      body: Column(
        // mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: 20,
                ),
                Container(
                  width: DeviceSize.width! * 0.8,
                  height: DeviceSize.height! * 0.3,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/images/data_breach.png'),
                    ),
                  ),
                ),
                const Text(
                  'Learn whether a password has been compromised.',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Gap(DeviceSize.height! * 0.025),
                const Text(
                  "Reusing passwords raises breach risk; we'll check for known breaches and notify if your email's linked accounts are compromised.",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    // fontWeight: FontWeight.bold,
                  ),
                ),
                // SizedBox(
                //   height: 200,
                // ),
                Gap(DeviceSize.height! * 0.23),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: DeviceBorder.fix.circularRadius,
                    ),
                    fixedSize: Size(DeviceSize.width! * 0.8, 50),
                  ),
                  onPressed: () {
                    _dataBreachMonitoringRepository.sawDataBreachOnBoarding();
                    Navigation.push(page: const DataBreachEmail());
                  },
                  child: const Text(
                    'Next',
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                        fontWeight: FontWeight.bold),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
