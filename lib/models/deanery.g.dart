// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'deanery.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class DeaneryAdapter extends TypeAdapter<Deanery> {
  @override
  final int typeId = 10;

  @override
  Deanery read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Deanery(
      parishes: (fields[3] as List)?.cast<Parish>(),
      id: fields[0] as int,
      name: fields[1] as String,
      other: fields[2] as String,
    );
  }

  @override
  void write(BinaryWriter writer, Deanery obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.name)
      ..writeByte(2)
      ..write(obj.other)
      ..writeByte(3)
      ..write(obj.parishes);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is DeaneryAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
