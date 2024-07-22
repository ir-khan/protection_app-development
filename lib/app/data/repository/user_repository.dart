import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:protection_app/app/core/result/result.dart';
import 'package:protection_app/app/data/models/premium/premium_model.dart';
import 'package:protection_app/app/data/models/user/user_model.dart';
import 'package:protection_app/app/data/repository/local/user_local_repository.dart';

class UserRepository {
  final _ref = FirebaseFirestore.instance.collection('users');
  final UserLocalRepository _localRepository = UserLocalRepository();

  Future<Result> createUser(UserModel model) async {
    try {
      _localRepository.setUserId(model.id!);
      await _ref.doc(model.id).set(model.toMap());
      return SuccessResult();
    } catch (e) {
      return ErrorResult(message: e.toString());
    }
  }

  Future<Result> updateProPlan(PremiumModel model) async {
    try {
      var userId = _localRepository.getUserId();
      await _ref.doc(userId).update({'premium': model.toMap()});
      return SuccessResult();
    } catch (e) {
      return ErrorResult(message: e.toString());
    }
  }

  Future<DataResult<UserModel>> currentUser() async {
    try {
      var userId = _localRepository.getUserId();
      var documentSnapshot = await _ref.doc(userId).get();
      var userModel = UserModel.fromMap(documentSnapshot.data()!);
      return SuccessDataResult(data: userModel);
    } catch (e) {
      return ErrorDataResult(message: e.toString());
    }
  }

  Future<DataResult<UserModel>> getByDeviceId(String deviceId) async {
    try {
      var documentSnapshot = await _ref
          .where(
            'deviceId',
            isEqualTo: deviceId,
          )
          .get();

      var userModel = UserModel.fromMap(documentSnapshot.docs.first.data());
      await _localRepository.setUserId(userModel.id!);
      return SuccessDataResult(data: userModel);
    } catch (e) {
      return ErrorDataResult(message: e.toString());
    }
  }
}
