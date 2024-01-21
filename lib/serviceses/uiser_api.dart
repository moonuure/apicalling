import 'dart:convert';
import 'package:apicalling/models/user.dart';
import 'package:http/http.dart' as http;
import '../models/username.dart';

// Class responsible for fetching user data from the API
class UserApi {
  // Static method to asynchronously fetch a list of User objects
  static Future<List<User?>> fetchUsers() async {
    print("Fetching data...");
    const url = 'https://randomuser.me/api/?results=30';
    final uri = Uri.parse(url);
    final response = await http.get(uri);
    final body = response.body;
    final json = jsonDecode(body);
    final results = json['results'] as List<dynamic>;

    print("result waa la helay ${results}");

    // Mapping the dynamic results to a list of User objects
    final users = results.map((e) {
      return User.fromMap(e);
    }).toList();

    print("Halkaan waa lasoo gaaray ${users}");
    return users;
  }
}
