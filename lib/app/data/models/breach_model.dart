// // ignore_for_file: public_member_api_docs, sort_constructors_first
// import 'dart:convert';

// import 'package:equatable/equatable.dart';

// class BreachModel with EquatableMixin {
//   String? name;
//   String? title;
//   String? domain;
//   String? breachDate;
//   String? addedDate;
//   String? modifiedDate;
//   int? pwnCount;
//   // String? description;
//   List<String>? dataClasses;
//   bool? isVerified;
//   bool? isFabricated;
//   bool? isSensitive;
//   bool? isRetired;
//   bool? isSpamList;
//   bool? isMalware;
//   bool? isSubscriptionFree;
//   String? logoPath;

//   BreachModel({
//     this.name,
//     this.title,
//     this.domain,
//     this.breachDate,
//     this.addedDate,
//     this.modifiedDate,
//     this.pwnCount,
//     // this.description,
//     this.dataClasses,
//     this.isVerified,
//     this.isFabricated,
//     this.isSensitive,
//     this.isRetired,
//     this.isSpamList,
//     this.isMalware,
//     this.isSubscriptionFree,
//     this.logoPath,
//   });

//   @override
//   List<Object?> get props => [
//         name,
//         title,
//         domain,
//         breachDate,
//         addedDate,
//         modifiedDate,
//         pwnCount,
//         // description,
//         dataClasses,
//         isVerified,
//         isFabricated,
//         isSensitive,
//         isRetired,
//         isSpamList,
//         isMalware,
//         isSubscriptionFree,
//         logoPath
//       ];

//   BreachModel copyWith({
//     String? name,
//     String? title,
//     String? domain,
//     String? breachDate,
//     String? addedDate,
//     String? modifiedDate,
//     int? pwnCount,
//     // String? description,
//     List<String>? dataClasses,
//     bool? isVerified,
//     bool? isFabricated,
//     bool? isSensitive,
//     bool? isRetired,
//     bool? isSpamList,
//     bool? isMalware,
//     bool? isSubscriptionFree,
//     String? logoPath,
//   }) {
//     return BreachModel(
//       name: name ?? this.name,
//       title: title ?? this.title,
//       domain: domain ?? this.domain,
//       breachDate: breachDate ?? this.breachDate,
//       addedDate: addedDate ?? this.addedDate,
//       modifiedDate: modifiedDate ?? this.modifiedDate,
//       pwnCount: pwnCount ?? this.pwnCount,
//       // description: description ?? this.description,
//       dataClasses: dataClasses ?? this.dataClasses,
//       isVerified: isVerified ?? this.isVerified,
//       isFabricated: isFabricated ?? this.isFabricated,
//       isSensitive: isSensitive ?? this.isSensitive,
//       isRetired: isRetired ?? this.isRetired,
//       isSpamList: isSpamList ?? this.isSpamList,
//       isMalware: isMalware ?? this.isMalware,
//       isSubscriptionFree: isSubscriptionFree ?? this.isSubscriptionFree,
//       logoPath: logoPath ?? this.logoPath,
//     );
//   }

//   Map<String, dynamic> toMap() {
//     return <String, dynamic>{
//       'Name': name,
//       'Title': title,
//       'Domain': domain,
//       'BreachDate': breachDate,
//       'AddedDate': addedDate,
//       'ModifiedDate': modifiedDate,
//       'PwnCount': pwnCount,
//       // 'Description': description,
//       'DataClasses': dataClasses,
//       'IsVerified': isVerified,
//       'IsFabricated': isFabricated,
//       'IsSensitive': isSensitive,
//       'IsRetired': isRetired,
//       'IsSpamList': isSpamList,
//       'IsMalware': isMalware,
//       'IsSubscriptionFree': isSubscriptionFree,
//       'LogoPath': logoPath,
//     };
//   }

//   factory BreachModel.fromMap(Map<String, dynamic> map) {
//     return BreachModel(
//       name: map['Name'] != null ? map['Name'] as String : null,
//       title: map['Title'] != null ? map['Title'] as String : null,
//       domain: map['Domain'] != null ? map['Domain'] as String : null,
//       breachDate:
//           map['BreachDate'] != null ? map['BreachDate'] as String : null,
//       addedDate: map['AddedDate'] != null ? map['AddedDate'] as String : null,
//       modifiedDate:
//           map['ModifiedDate'] != null ? map['ModifiedDate'] as String : null,
//       pwnCount: map['PwnCount'] != null ? map['PwnCount'] as int : null,
//       // description: map['Description'] != null ? map['Description'] as String : null,
//       dataClasses: map['DataClasses'] != null
//           ? List<String>.from((map['DataClasses'] as List<dynamic>))
//           : null,
//       isVerified: map['IsVerified'] != null ? map['IsVerified'] as bool : null,
//       isFabricated:
//           map['IsFabricated'] != null ? map['IsFabricated'] as bool : null,
//       isSensitive:
//           map['IsSensitive'] != null ? map['IsSensitive'] as bool : null,
//       isRetired: map['IsRetired'] != null ? map['IsRetired'] as bool : null,
//       isSpamList: map['IsSpamList'] != null ? map['IsSpamList'] as bool : null,
//       isMalware: map['IsMalware'] != null ? map['IsMalware'] as bool : null,
//       isSubscriptionFree: map['IsSubscriptionFree'] != null
//           ? map['IsSubscriptionFree'] as bool
//           : null,
//       logoPath: map['LogoPath'] != null ? map['logoPath'] as String : null,
//     );
//   }

//   String toJson() => json.encode(toMap());

//   factory BreachModel.fromJson(String source) =>
//       BreachModel.fromMap(json.decode(source) as Map<String, dynamic>);
// }

// To parse this JSON data, do
//
//     final breachModel = breachModelFromMap(jsonString);

import 'dart:convert';

BreachModel breachModelFromMap(String str) =>
    BreachModel.fromMap(json.decode(str));

String breachModelToMap(BreachModel data) => json.encode(data.toMap());

class BreachModel {
  final String name;
  final String title;
  final String domain;
  final DateTime breachDate;
  final DateTime addedDate;
  final DateTime modifiedDate;
  final int pwnCount;
  final String description;
  final String logoPath;
  final List<String> dataClasses;
  final bool isVerified;
  final bool isFabricated;
  final bool isSensitive;
  final bool isRetired;
  final bool isSpamList;
  final bool isMalware;
  final bool isSubscriptionFree;

  BreachModel({
    required this.name,
    required this.title,
    required this.domain,
    required this.breachDate,
    required this.addedDate,
    required this.modifiedDate,
    required this.pwnCount,
    required this.description,
    required this.logoPath,
    required this.dataClasses,
    required this.isVerified,
    required this.isFabricated,
    required this.isSensitive,
    required this.isRetired,
    required this.isSpamList,
    required this.isMalware,
    required this.isSubscriptionFree,
  });

  BreachModel copyWith({
    String? name,
    String? title,
    String? domain,
    DateTime? breachDate,
    DateTime? addedDate,
    DateTime? modifiedDate,
    int? pwnCount,
    String? description,
    String? logoPath,
    List<String>? dataClasses,
    bool? isVerified,
    bool? isFabricated,
    bool? isSensitive,
    bool? isRetired,
    bool? isSpamList,
    bool? isMalware,
    bool? isSubscriptionFree,
  }) =>
      BreachModel(
        name: name ?? this.name,
        title: title ?? this.title,
        domain: domain ?? this.domain,
        breachDate: breachDate ?? this.breachDate,
        addedDate: addedDate ?? this.addedDate,
        modifiedDate: modifiedDate ?? this.modifiedDate,
        pwnCount: pwnCount ?? this.pwnCount,
        description: description ?? this.description,
        logoPath: logoPath ?? this.logoPath,
        dataClasses: dataClasses ?? this.dataClasses,
        isVerified: isVerified ?? this.isVerified,
        isFabricated: isFabricated ?? this.isFabricated,
        isSensitive: isSensitive ?? this.isSensitive,
        isRetired: isRetired ?? this.isRetired,
        isSpamList: isSpamList ?? this.isSpamList,
        isMalware: isMalware ?? this.isMalware,
        isSubscriptionFree: isSubscriptionFree ?? this.isSubscriptionFree,
      );

  factory BreachModel.fromMap(Map<String, dynamic> json) => BreachModel(
        name: json["Name"],
        title: json["Title"],
        domain: json["Domain"],
        breachDate: DateTime.parse(json["BreachDate"]),
        addedDate: DateTime.parse(json["AddedDate"]),
        modifiedDate: DateTime.parse(json["ModifiedDate"]),
        pwnCount: json["PwnCount"],
        description: json["Description"],
        logoPath: json["LogoPath"],
        dataClasses: List<String>.from(json["DataClasses"].map((x) => x)),
        isVerified: json["IsVerified"],
        isFabricated: json["IsFabricated"],
        isSensitive: json["IsSensitive"],
        isRetired: json["IsRetired"],
        isSpamList: json["IsSpamList"],
        isMalware: json["IsMalware"],
        isSubscriptionFree: json["IsSubscriptionFree"],
      );

  Map<String, dynamic> toMap() => {
        "Name": name,
        "Title": title,
        "Domain": domain,
        "BreachDate":
            "${breachDate.year.toString().padLeft(4, '0')}-${breachDate.month.toString().padLeft(2, '0')}-${breachDate.day.toString().padLeft(2, '0')}",
        "AddedDate": addedDate.toIso8601String(),
        "ModifiedDate": modifiedDate.toIso8601String(),
        "PwnCount": pwnCount,
        "Description": description,
        "LogoPath": logoPath,
        "DataClasses": List<dynamic>.from(dataClasses.map((x) => x)),
        "IsVerified": isVerified,
        "IsFabricated": isFabricated,
        "IsSensitive": isSensitive,
        "IsRetired": isRetired,
        "IsSpamList": isSpamList,
        "IsMalware": isMalware,
        "IsSubscriptionFree": isSubscriptionFree,
      };
}
