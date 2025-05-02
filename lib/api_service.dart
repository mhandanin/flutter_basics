import 'dart:convert';
import 'package:http/http.dart' as http;
import 'user_api_model.dart';

class ApiService {
  static const String baseUrl = 'https://jsonplaceholder.typicode.com';

  static Future<UserApiModel> getUserById(int id) async {
    final url = Uri.parse('$baseUrl/users/$id');
    try {
      final response = await http.get(url);
      if (response.statusCode == 200) {
        final Map<String, dynamic> data = jsonDecode(response.body);
        return UserApiModel.fromJson(data);
      } else {
        throw Exception(
          'Échec du chargement de l\'utilisateur: ${response.statusCode}',
        );
      }
    } catch (error) {
      throw Exception('error reseau: $error');
    }
  }

  static Future<List<UserApiModel>> getAllUsers() async {
    final url = Uri.parse('$baseUrl/users');
    try {
      final response = await http.get(url);
      if (response.statusCode == 200) {
        final List<dynamic> usersJson = jsonDecode(response.body);
        return usersJson.map((json) => UserApiModel.fromJson(json)).toList();
      } else {
        throw Exception(
          'Échec du chargement des users:  ${response.statusCode}',
        );
      }
    } catch (error) {
      throw Exception('Erreur reseau: $error');
    }
  }

  static Future<UserApiModel> createUser(Map<String, dynamic> userData) async {
    final url = Uri.parse('$baseUrl/users');
    try {
      final String jsonBody = jsonEncode(userData);
      final headers = {'Content-Type': 'application/json; charset=UTF-8'};
      final response = await http.post(url, headers: headers, body: jsonBody);
      if (response.statusCode == 201) {
        return UserApiModel.fromJson(jsonDecode(response.body));
      } else {
        throw Exception('user creation failure ${response.statusCode}');
      }
    } catch (error) {
      throw Exception('Erreur reseau: $error');
    }
  }

  static Future<UserApiModel> updateUser(
    int id,
    Map<String, dynamic> userData,
  ) async {
    final url = Uri.parse('$baseUrl/users/$id');
    try {
      final String jsonBody = jsonEncode(userData);
      final headers = {'Content-Type': 'application/json; charset=UTF-8'};
      final response = await http.put(url, headers: headers, body: jsonBody);
      if (response.statusCode == 200) {
        return UserApiModel.fromJson(jsonDecode(response.body));
      } else {
        throw Exception('updating user failure:  ${response.statusCode}');
      }
    } catch (error) {
      throw Exception('Erreur reseau: $error');
    }
  }

  static Future<bool> deleteUser(int id) async {
    final url = Uri.parse('$baseUrl/users/$id');
    try {
      final response = await http.delete(url);
      return response.statusCode == 200 || response.statusCode == 204;
    } catch (error) {
      throw Exception('Erreur reseau: $error');
    }
  }


}
