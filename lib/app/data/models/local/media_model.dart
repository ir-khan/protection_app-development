// ignore_for_file: public_member_api_docs, sort_constructors_first
// ignore_for_file: must_be_immutable

import 'dart:typed_data';

import 'package:equatable/equatable.dart';
import 'package:hive_flutter/hive_flutter.dart';

part 'media_model.g.dart';

@HiveType(typeId: 1)
class MediaModel extends Equatable {
  @HiveField(0)
  String? id;
  @HiveField(1)
  String? media;
  @HiveField(2)
  Uint8List? thumbnail;
  @HiveField(3)
  String? type;
  @HiveField(4)
  String? date;

  MediaModel({
    this.id,
    this.media,
    this.thumbnail,
    this.type,
    this.date,
  });

  @override
  List<Object?> get props => [
        id,
        media,
        thumbnail,
        type,
        date,
      ];
}
