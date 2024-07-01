import 'package:flutter/material.dart';
import 'package:day_care_app/pages/db_helper.dart'; // Ganti dengan path yang sesuai

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final _formKey = GlobalKey<FormState>();
  String email = '';
  String password = '';
  String confirmPassword = '';
  String name = ''; // Tambahkan field untuk nama
  String role = 'parent'; // Atur peran default, bisa diubah sesuai kebutuhan

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("images/bg_register.jpg"),
            fit: BoxFit.cover,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Center(
            child: SingleChildScrollView(
              child: Form(
                key: _formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    const Icon(
                      Icons.account_circle,
                      size: 150,
                      color: Colors.blueAccent,
                    ),
                    const SizedBox(height: 20.0),
                    const Text(
                      'Register',
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(height: 20.0),
                    TextFormField(
                      decoration: InputDecoration(
                        hintText: 'Name',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        filled: true,
                        fillColor: Colors.white,
                        prefixIcon:
                            const Icon(Icons.person, color: Colors.blueAccent),
                      ),
                      validator: (val) =>
                          val!.isEmpty ? 'Enter your name' : null,
                      onChanged: (val) {
                        setState(() => name = val);
                      },
                    ),
                    const SizedBox(height: 20.0),
                    TextFormField(
                      decoration: InputDecoration(
                        hintText: 'Email',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        filled: true,
                        fillColor: Colors.white,
                        prefixIcon:
                            const Icon(Icons.email, color: Colors.blueAccent),
                      ),
                      validator: (val) =>
                          val!.isEmpty ? 'Enter an email' : null,
                      onChanged: (val) {
                        setState(() => email = val);
                      },
                    ),
                    const SizedBox(height: 20.0),
                    TextFormField(
                      decoration: InputDecoration(
                        hintText: 'Password',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        filled: true,
                        fillColor: Colors.white,
                        prefixIcon:
                            const Icon(Icons.lock, color: Colors.blueAccent),
                      ),
                      obscureText: true,
                      validator: (val) => val!.length < 6
                          ? 'Enter a password 6+ chars long'
                          : null,
                      onChanged: (val) {
                        setState(() => password = val);
                      },
                    ),
                    const SizedBox(height: 20.0),
                    TextFormField(
                      decoration: InputDecoration(
                        hintText: 'Confirm Password',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        filled: true,
                        fillColor: Colors.white,
                        prefixIcon:
                            const Icon(Icons.lock, color: Colors.blueAccent),
                      ),
                      obscureText: true,
                      validator: (val) =>
                          val != password ? 'Passwords do not match' : null,
                      onChanged: (val) {
                        setState(() => confirmPassword = val);
                      },
                    ),
                    const SizedBox(height: 20.0),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        foregroundColor: Colors.white,
                        padding: const EdgeInsets.symmetric(
                            horizontal: 50, vertical: 15),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        backgroundColor: Colors.blueAccent,
                      ),
                      child: const Text('Sign Up'),
                      onPressed: () async {
                        if (_formKey.currentState!.validate()) {
                          // Simpan data pengguna ke database
                          Map<String, dynamic> user = {
                            'name': name,
                            'email': email,
                            'password': password,
                            'role': role,
                          };
                          int id =
                              await DatabaseHelper.instance.insertUser(user);
                          print('User successfully registered with id: $id');

                          // Ambil semua pengguna dan cetak ke debug console
                          List<Map<String, dynamic>> users =
                              await DatabaseHelper.instance.queryAllUsers();
                          print('All users: $users');

                          Navigator.pop(context);
                        }
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
