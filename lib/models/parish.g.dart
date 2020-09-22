// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'parish.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ParishAdapter extends TypeAdapter<Parish> {
  @override
  final int typeId = 7;

  @override
  Parish read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Parish(
      id: fields[0] as int,
      name: fields[1] as String,
      image: fields[2] as String,
      longitude: fields[3] as double,
      latitude: fields[4] as double,
      mapUrl: fields[5] as String,
      address: fields[6] as String,
      email: fields[7] as String,
      phone: fields[8] as String,
      parishPriest: fields[9] as String,
      totalPriests: fields[10] as int,
      confessionDetail: fields[13] as String,
      massDetail: fields[12] as String,
      deaneryId: fields[11] as int,
    );
  }

  @override
  void write(BinaryWriter writer, Parish obj) {
    writer
      ..writeByte(14)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.name)
      ..writeByte(2)
      ..write(obj.image)
      ..writeByte(3)
      ..write(obj.longitude)
      ..writeByte(4)
      ..write(obj.latitude)
      ..writeByte(5)
      ..write(obj.mapUrl)
      ..writeByte(6)
      ..write(obj.address)
      ..writeByte(7)
      ..write(obj.email)
      ..writeByte(8)
      ..write(obj.phone)
      ..writeByte(9)
      ..write(obj.parishPriest)
      ..writeByte(10)
      ..write(obj.totalPriests)
      ..writeByte(11)
      ..write(obj.deaneryId)
      ..writeByte(12)
      ..write(obj.massDetail)
      ..writeByte(13)
      ..write(obj.confessionDetail);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ParishAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
