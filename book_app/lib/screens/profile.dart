import 'package:flutter/material.dart';

class Profile extends StatelessWidget {
  final String username;
  final String name;

  const Profile({super.key, required this.username, required this.name});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: [
          Icon(Icons.person, size: 50),
          Text("Username: $username"),
          Text("Name: $name"),
        ],
      ),
    );
  }
}