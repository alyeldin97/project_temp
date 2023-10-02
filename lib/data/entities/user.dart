import 'dart:developer';
import 'package:project_template/domain/models/null_checkers.dart';
import '../../configs/constants/json_keys.dart';
import '../../domain/models/user.dart';

class UserEntity {
  String firstName;
  String refreshToken;
  String accessToken;
  String lastName;
  String email;
  String username;
  String password;
  String phone;
  int loginCount;
  bool verified;
  bool qualified;
  String id;
  String createdAt;
  String updatedAt;

  int V;

  UserEntity({
    required this.refreshToken,
    required this.accessToken,
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.username,
    required this.password,
    required this.phone,
    required this.loginCount,
    required this.verified,
    required this.qualified,
    required this.id,
    required this.createdAt,
    required this.updatedAt,
    required this.V,
  });

  factory UserEntity.fromJson(Map<String, dynamic> json) => UserEntity(
        firstName:
            (json[JsonKeys.firstName] as String?).ifNullOrEmptyReturn(""),
        lastName: (json[JsonKeys.lastName] as String?).ifNullOrEmptyReturn(""),
        email: (json[JsonKeys.email] as String?).ifNullOrEmptyReturn(""),
        username: (json[JsonKeys.username] as String?).ifNullOrEmptyReturn(""),
        password: (json[JsonKeys.password] as String?).ifNullOrEmptyReturn(""),
        phone: (json[JsonKeys.phone] as String?).ifNullOrEmptyReturn(""),
        loginCount: (json[JsonKeys.loginCount] as int?).ifNullReturn(0),
        verified: (json[JsonKeys.verified] as bool?).ifNullReturn(false),
        qualified: (json[JsonKeys.qualified] as bool?).ifNullReturn(false),
        id: (json[JsonKeys.Id] as String?).ifNullOrEmptyReturn(""),
        createdAt:
            (json[JsonKeys.createdAt] as String?).ifNullOrEmptyReturn(""),
        updatedAt:
            (json[JsonKeys.updatedAt] as String?).ifNullOrEmptyReturn(""),
        V: (json[JsonKeys.V] as int?).ifNullReturn(0),
        refreshToken:
            (json[JsonKeys.refreshToken] as String?).ifNullOrEmptyReturn(""),
        accessToken:
            (json[JsonKeys.accessToken] as String?).ifNullOrEmptyReturn(""),
      );

  UserModel toModel() {
    return UserModel(
      firstName: firstName,
      lastName: lastName,
      email: email,
      username: username,
      password: password,
      phone: phone,
      loginCount: loginCount,
      verified: verified,
      qualified: qualified,
      id: id,
      createdAt: createdAt,
      tokenIssuingTime: DateTime.parse(updatedAt),
      V: V,
      refreshToken: refreshToken,
      accessToken: accessToken,
    );
  }
}
