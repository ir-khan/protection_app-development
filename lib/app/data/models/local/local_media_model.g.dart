// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'local_media_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class LocalMediaModelAdapter extends TypeAdapter<LocalMediaModel> {
  @override
  final int typeId = 0;

  @override
  LocalMediaModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return LocalMediaModel(
      key: fields[0] as String?,
      medias: (fields[1] as List?)?.cast<MediaModel>(),
    );
  }

  @override
  void write(BinaryWriter writer, LocalMediaModel obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.key)
      ..writeByte(1)
      ..write(obj.medias);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is LocalMediaModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
