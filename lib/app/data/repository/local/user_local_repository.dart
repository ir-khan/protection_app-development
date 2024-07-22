import 'package:protection_app/app/core/hive/hive.dart';

class UserLocalRepository {
  Future<void> setUserId(String userId) async {
    await userBox.put('user', userId);
  }

  String? getUserId() {
    return userBox.get('user');
  }
}
