import 'dart:convert';
import 'package:apicalling/models/user.dart';
import 'package:http/http.dart' as http;
import '../models/username.dart';

// Class responsible for fetching user data from the API
class UserApi {
  // Static method to asynchronously fetch a list of User objects
  static Future<List<User>> fetchUsers() async {
    print("Fetching data...");
    const url = 'https://randomuser.me/api/?results=30';
    final uri = Uri.parse(url);
    final response = await http.get(uri);
    final body = response.body;
    final json = jsonDecode(body);
    final results = json['results'] as List<dynamic>;

    // Mapping the dynamic results to a list of User objects
    final users = results.map((e) {
      // Creating a UserName object from the 'name' field in the result
      final name = UserName(
          title: e['name']['title'],
          first: e['name']['first'],
          last: e['name']['last']);
      return User(
        gender: e['gender'],
        email: e['email'],
        phone: e['phone'],
        cell: e['cell'],
        nat: e['nat'],
        name: name,
      );
    }).toList();
    return users;
  }
}
