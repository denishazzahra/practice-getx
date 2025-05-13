import 'dart:convert';
import 'package:http/http.dart' as http;
import '../../app/data/models/user_model.dart';
import '../api/api_config.dart';

class UserService {
  static Future<Map<String, dynamic>> getAllUsers() async {
    try {
      final response = await http.get(Uri.parse(ApiConfig.baseUrl));
      if (response.statusCode == 200) {
        return jsonDecode(response.body);
      } else {
        throw Exception('Failed to load users');
      }
    } catch (e) {
      throw Exception('Failed to load users: $e');
    }
  }

  static Future<Map<String, dynamic>> getUserById(int id) async {
    try {
      final response = await http.get(Uri.parse('${ApiConfig.baseUrl}/$id'));
      if (response.statusCode == 200) {
        return jsonDecode(response.body);
      } else {
        throw Exception('Failed to load user');
      }
    } catch (e) {
      throw Exception('Failed to load user: $e');
    }
  }

  static Future<Map<String, dynamic>> createUser(UserModel user) async {
    try {
      final response = await http.post(
        Uri.parse(ApiConfig.baseUrl),
        headers: <String, String>{'Content-Type': 'application/json'},
        body: jsonEncode(user.toJson()),
      );
      if (response.statusCode == 201) {
        return jsonDecode(response.body);
      } else {
        throw Exception('Failed to create user');
      }
    } catch (e) {
      throw Exception('Failed to create user: $e');
    }
  }

  static Future<Map<String, dynamic>> updateUser(int id, UserModel user) async {
    try {
      final response = await http.put(
        Uri.parse('${ApiConfig.baseUrl}/$id'),
        headers: <String, String>{'Content-Type': 'application/json'},
        body: jsonEncode(user),
      );
      if (response.statusCode == 200) {
        return jsonDecode(response.body);
      } else {
        throw Exception('Failed to update user');
      }
    } catch (e) {
      throw Exception('Failed to update user: $e');
    }
  }

  static Future<Map<String, dynamic>> deleteUser(int id) async {
    try {
      final response = await http.delete(Uri.parse('${ApiConfig.baseUrl}/$id'));
      if (response.statusCode == 200) {
        return jsonDecode(response.body);
      } else {
        throw Exception('Failed to delete user');
      }
    } catch (e) {
      throw Exception('Failed to delete user: $e');
    }
  }
}
