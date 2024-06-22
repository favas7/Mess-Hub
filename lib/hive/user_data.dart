import 'package:hive/hive.dart';

part 'user_data.g.dart';

@HiveType(typeId: 1)
class UserData {
  @HiveField(0)
  final String id;

  @HiveField(1)
  final String name;

  @HiveField(2)
  final String email;

  @HiveField(3)
  final String phone;

  UserData({
    required this.id,
    required this.name,
    required this.email,
    required this.phone,
  });
}

// Run this command to generate the adapter:
// flutter packages pub run build_runner build
