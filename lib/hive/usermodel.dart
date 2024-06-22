import 'package:flutter/foundation.dart';
import 'package:hive/hive.dart';
import 'user_data.dart';

const String userDb = 'userDb';

class UserRepository {
  Future<void> addUser({required UserData user}) async {
    try {
      final box = await Hive.openBox<UserData>(userDb);
      await box.put(user.id, user);
      if (kDebugMode) {
        print('User added successfully.');
      }
    } catch (e) {
      if (kDebugMode) {
        print('Error adding user: $e');
      }
    }
  }

  Future<List<UserData>> getUsers() async {
    final box = await Hive.openBox<UserData>(userDb);
    return box.values.toList();
  }

  Future<void> updateUser({required UserData user}) async {
    try {
      final box = await Hive.openBox<UserData>(userDb);
      await box.put(user.id, user);
      if (kDebugMode) {
        print('User updated successfully.');
      }
    } catch (e) {
      if (kDebugMode) {
        print('Error updating user: $e');
      }
    }
  }

  Future<void> deleteUser({required String userId}) async {
    try {
      final box = await Hive.openBox<UserData>(userDb);
      await box.delete(userId);
      if (kDebugMode) {
        print('User deleted successfully.');
      }
    } catch (e) {
      if (kDebugMode) {
        print('Error deleting user: $e');
      }
    }
  }
}
