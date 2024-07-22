import 'package:protection_app/app/core/hive/hive.dart';

class SecurelyLocalRepository {
  bool? getSecurelyOnboarding() {
    return securelyOnboarding.get('securelyOnboarding');
  }

  Future<void> sawSecurelyOnboarding() async {
    await securelyOnboarding.put('securelyOnboarding', true);
  }
}
