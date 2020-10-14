// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'prayer.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class PrayerAdapter extends TypeAdapter<Prayer> {
  @override
  final int typeId = 11;

  @override
  Prayer read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Prayer(
      id: fields[0] as int,
      title: fields[1] as String,
      content: fields[2] as String,
      prayerCategoryId: fields[3] as int,
    );
  }

  @override
  void write(BinaryWriter writer, Prayer obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.title)
      ..writeByte(2)
      ..write(obj.content)
      ..writeByte(3)
      ..write(obj.prayerCategoryId);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is PrayerAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
