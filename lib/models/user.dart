import 'package:apicalling/models/username.dart';
class User {
  final String gender;
  final String email;
  final String phone;
  final String cell;
  final String nat;
  final UserName name;

  User({
    required this.gender,
    required this.email,
    required this.phone,
    required this.cell,
    required this.nat,
    required this.name,
  });

  String get FullName {
    // Correcting the string interpolation syntax
    return '${name.title} {name.first} {name.last}';
  }
}
