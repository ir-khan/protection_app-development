// ignore_for_file: public_member_api_docs, sort_constructors_first
// ignore_for_file: must_be_immutable

import 'package:equatable/equatable.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:protection_app/app/data/models/local/media_model.dart';

part 'local_media_model.g.dart';

@HiveType(typeId: 0)
class LocalMediaModel extends Equatable {
  @HiveField(0)
  String? key;
  @HiveField(1)
  List<MediaModel>? medias;

  LocalMediaModel({
    this.key,
    this.medias,
  });

  @override
  List<Object?> get props => [
        key,
        medias,
      ];

  map(Function(dynamic xFile) param0) {}
}
