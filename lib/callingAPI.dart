import 'package:apicalling/serviceses/uiser_api.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';

import 'models/user.dart';
import 'models/username.dart';

class ApiCalling extends StatefulWidget {
  @override
  State<ApiCalling> createState() => _ApiCallingState();
}

class _ApiCallingState extends State<ApiCalling> {
  List<User> users = [];

  @override
  void initState() {
    super.initState();
    fetchUsers();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.lightBlueAccent,
        elevation: 1,
        centerTitle: true,
        title: Text(
          "REST API Calling",
          style: TextStyle(color: Colors.white, fontSize: 25),
        ),
      ),
      body: ListView.builder(
        itemCount: users.length,
        itemBuilder: (context, index) {
          final user = users[index];
          final email = user.gender;
          // final color = user.gender == 'male' ? Colors.orange : Colors.brown;

          return ListTile(
            title: Text(user.name.title),
            subtitle: Text(user.phone),
            // tileColor: color,
          );
        },
      ),
    );
  }

  Future<void> fetchUsers() async {
    final response = await UserApi.fetchUsers();

    setState(() {
      users = response;
    });
  }

  // Future<void> fetchUsers() async {
  //   print("Fetching data...");
  //   const url = 'https://randomuser.me/api/?results=30';
  //   final uri = Uri.parse(url);
  //   final response = await http.get(uri);
  //   final body = response.body;
  //   final json = jsonDecode(body);
  //   final results = json['results'] as List<dynamic>;
  //   final transformed = results.map((e) {
  //     final name = UserName(
  //         title: e['name']['title'],
  //         first: e['name']['first'],
  //         last: e['name']['last']);
  //     return User(
  //       gender: e['gender'],
  //       email: e['email'],
  //       phone: e['phone'],
  //       cell: e['cell'],
  //       nat: e['nat'],
  //       name: name,
  //     );
  //   }).toList();
  //   setState(() {
  //     users = transformed;
  //   });

  //   print("Data fetched successfully.");
  // }
}
