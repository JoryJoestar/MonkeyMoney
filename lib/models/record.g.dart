// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'record.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class RecordAdapter extends TypeAdapter<Record> {
  @override
  final int typeId = 1;

  @override
  Record read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Record(
      id: fields[0] as String,
      money: fields[1] as double,
      desc: fields[2] as String,
      dateTime: fields[3] as DateTime,
      type: fields[4] as RecordType,
      icon: fields[5] as String,
    );
  }

  @override
  void write(BinaryWriter writer, Record obj) {
    writer
      ..writeByte(6)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.money)
      ..writeByte(2)
      ..write(obj.desc)
      ..writeByte(3)
      ..write(obj.dateTime)
      ..writeByte(4)
      ..write(obj.type)
      ..writeByte(5)
      ..write(obj.icon);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is RecordAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class RecordTypeAdapter extends TypeAdapter<RecordType> {
  @override
  final int typeId = 0;

  @override
  RecordType read(BinaryReader reader) {
    switch (reader.readByte()) {
      case 0:
        return RecordType.income;
      case 1:
        return RecordType.expense;
      default:
        return RecordType.income;
    }
  }

  @override
  void write(BinaryWriter writer, RecordType obj) {
    switch (obj) {
      case RecordType.income:
        writer.writeByte(0);
        break;
      case RecordType.expense:
        writer.writeByte(1);
        break;
    }
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is RecordTypeAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
