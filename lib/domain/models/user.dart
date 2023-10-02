import 'package:hive_flutter/hive_flutter.dart';
part 'user.g.dart';

@HiveType(typeId: 1)
class UserModel {
  @HiveField(0)
  String firstName;
  @HiveField(1)
  String refreshToken;
  @HiveField(2)
  String accessToken;
  @HiveField(3)
  String lastName;
  @HiveField(4)
  String email;
  @HiveField(5)
  String username;
  @HiveField(6)
  String password;
  @HiveField(7)
  String phone;
  @HiveField(8)
  int loginCount;
  @HiveField(9)
  bool verified;
  @HiveField(10)
  bool qualified;
  @HiveField(11)
  String id;
  @HiveField(12)
  String createdAt;
  @HiveField(13)
  DateTime tokenIssuingTime;
  @HiveField(14)
  int V;
  UserModel({
    required this.firstName,
    required this.refreshToken,
    required this.accessToken,
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
    required this.tokenIssuingTime,
    required this.V,
  });
}
