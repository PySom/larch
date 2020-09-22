// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'occasion.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class OccasionAdapter extends TypeAdapter<Occasion> {
  @override
  final int typeId = 6;

  @override
  Occasion read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Occasion(
      id: fields[0] as int,
      title: fields[1] as String,
      brief: fields[2] as String,
      content: fields[3] as String,
      image: fields[4] as String,
      startDate: fields[5] as String,
      endDate: fields[6] as String,
      datePosted: fields[7] as String,
    );
  }

  @override
  void write(BinaryWriter writer, Occasion obj) {
    writer
      ..writeByte(8)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.title)
      ..writeByte(2)
      ..write(obj.brief)
      ..writeByte(3)
      ..write(obj.content)
      ..writeByte(4)
      ..write(obj.image)
      ..writeByte(5)
      ..write(obj.startDate)
      ..writeByte(6)
      ..write(obj.endDate)
      ..writeByte(7)
      ..write(obj.datePosted);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is OccasionAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
