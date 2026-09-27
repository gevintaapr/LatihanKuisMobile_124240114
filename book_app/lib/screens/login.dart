import 'package:flutter/material.dart';
import '../root.dart';
import '../models/user.dart';

// login disini pake stateful karena dia bisa ubah data, bisa input.
class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
  //_LoginPageState menyimpan data dan tampilan yang bisa berubah.
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool isLoggedin = false;

  void _login() {
    String username = _usernameController.text;
    String password = _passwordController.text;

    if (users.any(
      (user) => user.username == username && user.password == password,
    )) {
      setState(() {
        isLoggedin = true;
      });

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Login Berhasil!"),
          backgroundColor: Colors.green,
        ),
      );
      // Navigator ini kan yang melanjutkan ke halaman selanjutnya
      // pushReplacement() mengganti halaman aktif dengan halaman baru tanpa menambah stack. Halaman sebelumnya akan dihapus dan diganti dengan halaman baru, sehingga tidak bisa kembali ke halaman sebelumnya.

      // Navigator.push(context, MaterialPageRoute(builder: (context) => Home()));
      Navigator.pushReplacement( //
        context,
        MaterialPageRoute(builder: (context) => Root(username: username)),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Login gagal: username atau password salah!"),
          backgroundColor: Colors.red,
        ),
      );
    }
  }

  void _logout() {
    setState(() {
      isLoggedin = false;
      _usernameController.clear();
      _passwordController.clear();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Login Page")),
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(8),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // if (!isLoggedin) ... [ //disebut spread collection, untuk memasukkan banyak widget ke dalam children
              Text("Login Page"),
              SizedBox(height: 20),
              _usernameField(_usernameController),
              _passwordField(_passwordController),
              SizedBox(height: 20),
              ElevatedButton(onPressed: _login, child: Text("Login")),
              // ] else ...[
              //   Text("Halo! ${username}"),
              //   SizedBox(height: 20),
              //   ElevatedButton(onPressed: _logout, child: Icon(Icons.logout)),
              // ]
            ],
          ),
        ),
      ),
    );
  }
}

Widget _usernameField(TextEditingController usernameController) {
  return SizedBox(
    width: 300,
    child: Container(
      child: TextField(
        controller: usernameController,
        enabled: true,
        decoration: InputDecoration(
          hintText: "username kamu",
          border: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(8)),
            borderSide: BorderSide(color: Colors.blue),
          ),
        ),
      ),
    ),
  );
}

Widget _passwordField(TextEditingController passwordController) {
  return SizedBox(
    width: 300,
    child: Container(
      child: TextField(
        controller: passwordController,
        enabled: true,
        decoration: InputDecoration(
          hintText: "password",
          border: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(8)),
            borderSide: BorderSide(color: Colors.blue),
          ),
        ),
      ),
    ),
  );
}
