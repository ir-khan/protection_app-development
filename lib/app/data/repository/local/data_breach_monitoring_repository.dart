import 'package:protection_app/app/core/hive/hive.dart';

class DataBreachMonitoringRepository {
  bool? getDataBreachOnBoarding() {
    return dataBreachOnBoarding.get('dataBreachOnBoarding');
  }

  Future<void> sawDataBreachOnBoarding() async {
    await dataBreachOnBoarding.put('dataBreachOnBoarding', true);
  }
}
