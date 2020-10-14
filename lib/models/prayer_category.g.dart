// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'prayer_category.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class PrayerCategoryAdapter extends TypeAdapter<PrayerCategory> {
  @override
  final int typeId = 12;

  @override
  PrayerCategory read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return PrayerCategory(
      id: fields[0] as int,
      title: fields[1] as String,
      prayers: (fields[2] as List)?.cast<Prayer>(),
    );
  }

  @override
  void write(BinaryWriter writer, PrayerCategory obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.title)
      ..writeByte(2)
      ..write(obj.prayers);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is PrayerCategoryAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
