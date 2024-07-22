import 'package:protection_app/app/core/hive/hive.dart';

class IsTrueRepository {
  bool? getIsTrue() {
    return isTrue.get('isTrue');
  }

  Future<void> sawIsTrue() async {
    await isTrue.put('isTrue', true);
  }
}
