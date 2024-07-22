import 'package:protection_app/app/data/models/premium/premium_model.dart';

class UserModel {
  String? id;
  String? deviceId;
  PremiumModel? premium;

  UserModel({
    this.id,
    this.deviceId,
    this.premium,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'deviceId': deviceId,
      'premium': premium?.toMap(),
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      id: map['id'] != null ? map['id'] as String : null,
      deviceId: map['deviceId'] != null ? map['deviceId'] as String : null,
      premium: map['premium'] == null
          ? null
          : PremiumModel.fromMap(map['premium'] as Map<String, dynamic>),
    );
  }
}
