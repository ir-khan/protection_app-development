// // ignore_for_file: public_member_api_docs, sort_constructors_first
// import 'dart:convert';

// import 'package:equatable/equatable.dart';

// class BreachEmailSearchModel with EquatableMixin {
//   String? name;
//   String? title;

//   BreachEmailSearchModel({
//     this.name,
//     this.title,
//   });

//   @override
//   List<Object?> get props => [name,title];

//   BreachEmailSearchModel copyWith({
//     String? name,
//     String? title,
//   }) {
//     return BreachEmailSearchModel(
//       name: name ?? this.name,
//       title: title ?? this.title,
//     );
//   }

//   Map<String, dynamic> toMap() {
//     return <String, dynamic>{
//       'name': name,
//       'title': title,
//     };
//   }

//   factory BreachEmailSearchModel.fromMap(Map<String, dynamic> map) {
//     return BreachEmailSearchModel(
//       name: map['name'] != null ? map['name'] as String : null,
//       title: map['name'] != null ? map['name'] as String : null,
//     );
//   }

//   String toJson() => json.encode(toMap());

//   factory BreachEmailSearchModel.fromJson(String source) =>
//       BreachEmailSearchModel.fromMap(
//           json.decode(source) as Map<String, dynamic>);
// }
