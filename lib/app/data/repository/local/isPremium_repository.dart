import 'package:protection_app/app/core/hive/hive.dart';

class IsPremiumRepository {
  bool? getIsPremium() {
    return isPremium.get('isPremium');
  }

  Future<void> sawIsPremium() async {
    await isPremium.put('isPremium', true);
  }
}
