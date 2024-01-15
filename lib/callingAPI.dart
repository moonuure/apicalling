import 'package:apicalling/serviceses/uiser_api.dart';
import 'package:flutter/material.dart';
import 'models/user.dart';

class ApiCalling extends StatefulWidget {
  @override
  State<ApiCalling> createState() => _ApiCallingState();
}

class _ApiCallingState extends State<ApiCalling> {
  List<User> users = [];

 // Method to fetch user data when the widget is initialized
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

  // Method to fetch user data asynchronously
  Future<void> fetchUsers() async {

    final response = await UserApi.fetchUsers();

    setState(() {
      users = response;
    });
  }
}