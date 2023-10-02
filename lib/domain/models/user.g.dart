// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class UserModelAdapter extends TypeAdapter<UserModel> {
  @override
  final int typeId = 1;

  @override
  UserModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return UserModel(
      firstName: fields[0] as String,
      refreshToken: fields[1] as String,
      accessToken: fields[2] as String,
      lastName: fields[3] as String,
      email: fields[4] as String,
      username: fields[5] as String,
      password: fields[6] as String,
      phone: fields[7] as String,
      loginCount: fields[8] as int,
      verified: fields[9] as bool,
      qualified: fields[10] as bool,
      id: fields[11] as String,
      createdAt: fields[12] as String,
      tokenIssuingTime: fields[13] as DateTime,
      V: fields[14] as int,
    );
  }

  @override
  void write(BinaryWriter writer, UserModel obj) {
    writer
      ..writeByte(15)
      ..writeByte(0)
      ..write(obj.firstName)
      ..writeByte(1)
      ..write(obj.refreshToken)
      ..writeByte(2)
      ..write(obj.accessToken)
      ..writeByte(3)
      ..write(obj.lastName)
      ..writeByte(4)
      ..write(obj.email)
      ..writeByte(5)
      ..write(obj.username)
      ..writeByte(6)
      ..write(obj.password)
      ..writeByte(7)
      ..write(obj.phone)
      ..writeByte(8)
      ..write(obj.loginCount)
      ..writeByte(9)
      ..write(obj.verified)
      ..writeByte(10)
      ..write(obj.qualified)
      ..writeByte(11)
      ..write(obj.id)
      ..writeByte(12)
      ..write(obj.createdAt)
      ..writeByte(13)
      ..write(obj.tokenIssuingTime)
      ..writeByte(14)
      ..write(obj.V);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is UserModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
