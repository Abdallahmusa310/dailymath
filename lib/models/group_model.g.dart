// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'group_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class GroupModelAdapter extends TypeAdapter<GroupModel> {
  @override
  final int typeId = 0;

  @override
  GroupModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return GroupModel(
      groupname: fields[0] as String?,
      groupgrade: fields[1] as String?,
      grouptime: fields[2] as String?,
      studentname: fields[3] as String?,
      parentphone: fields[4] as String?,
      day: fields[5] as int?,
      id: fields[6] as int?,
    );
  }

  @override
  void write(BinaryWriter writer, GroupModel obj) {
    writer
      ..writeByte(7)
      ..writeByte(0)
      ..write(obj.groupname)
      ..writeByte(1)
      ..write(obj.groupgrade)
      ..writeByte(2)
      ..write(obj.grouptime)
      ..writeByte(3)
      ..write(obj.studentname)
      ..writeByte(4)
      ..write(obj.parentphone)
      ..writeByte(5)
      ..write(obj.day)
      ..writeByte(6)
      ..write(obj.id);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is GroupModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
