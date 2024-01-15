import 'dart:convert';
import 'package:apicalling/models/user.dart';
import 'package:http/http.dart' as http;
import '../models/username.dart';

class UserApi {
  static Future<List<User>> fetchUsers() async {
    print("Fetching data...");
    const url = 'https://randomuser.me/api/?results=30';
    final uri = Uri.parse(url);
    final response = await http.get(uri);
    final body = response.body;
    final json = jsonDecode(body);
    final results = json['results'] as List<dynamic>;
    final users = results.map((e) {
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
