import 'package:book_app/screens/library.dart';
import 'package:flutter/material.dart';
import 'screens/profile.dart';

class Root extends StatefulWidget {
  final String username;
  final String name;
  
  const Root({super.key, required this.username, required this.name});

  @override
  State<Root> createState() => _RootState();
}

class _RootState extends State<Root> {
  int _selectedIndex = 0;
  final List<String> _title = ["Library", "Profile"];

  @override
  Widget build(BuildContext context) {
    final List<Widget> pages = [
      Library(username: widget.username),
      Profile(username: widget.username, name: widget.name),
    ];

    return Scaffold(
      appBar: AppBar(title: Text(_title[_selectedIndex])),
      body: pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.book), label: "Library"),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile"),
        ],
      ),
    );
  }
}
