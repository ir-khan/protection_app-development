import 'package:protection_app/app/core/hive/hive.dart';

class VaultLocalRepository {
  bool? getVaultOnboarding() {
    return vaultOnboarding.get('vaultOnboarding');
  }

  Future<void> sawVaultOnboarding() async {
    await vaultOnboarding.put('vaultOnboarding', true);
  }

  String? getVaultPassword() {
    return vaultPassword.get('vaultPassword');
  }

  Future<void> setVaultPassword(String password) async {
    await vaultPassword.put('vaultPassword', password);
  }
}
