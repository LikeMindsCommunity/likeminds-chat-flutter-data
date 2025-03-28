// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cache_schema.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class LMChatCacheSchemaAdapter extends TypeAdapter<LMChatCacheSchema> {
  @override
  final int typeId = 110;

  @override
  LMChatCacheSchema read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return LMChatCacheSchema(
      key: fields[0] as String,
      value: fields[1] as String,
    );
  }

  @override
  void write(BinaryWriter writer, LMChatCacheSchema obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.key)
      ..writeByte(1)
      ..write(obj.value);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is LMChatCacheSchemaAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
