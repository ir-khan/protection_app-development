// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:equatable/equatable.dart';

class PremiumModel extends Equatable {
  bool? isPremium;
  String? premiumType;
  String? revenueCatId;
  PremiumModel({
    this.isPremium,
    this.premiumType,
    this.revenueCatId,
  });

  @override
  List<Object?> get props => [
        isPremium,
        premiumType,
        revenueCatId,
      ];

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'isPremium': isPremium,
      'premiumType': premiumType,
      'revenueCatId': revenueCatId,
    };
  }

  factory PremiumModel.fromMap(Map<String, dynamic> map) {
    return PremiumModel(
      isPremium: map['isPremium'] != null ? map['isPremium'] as bool : null,
      premiumType:
          map['premiumType'] != null ? map['premiumType'] as String : null,
      revenueCatId:
          map['revenueCatId'] != null ? map['revenueCatId'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory PremiumModel.fromJson(String source) =>
      PremiumModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
