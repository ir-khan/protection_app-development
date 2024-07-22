import 'package:protection_app/app/core/hive/hive.dart';

class AppOnboardingRepository {
  bool? getAppOnboarding() {
    return appOnboarding.get('appOnboarding');
  }

  Future<void> sawAppOnboarding() async {
    await appOnboarding.put('appOnboarding', true);
  }
}
