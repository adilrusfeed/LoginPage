// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors_in_immutables, prefer_const_constructors, avoid_print, no_leading_underscores_for_local_identifiers, use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutter_application_1/home.dart';
import 'package:flutter_application_1/main.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginScreen extends StatefulWidget {
  LoginScreen({Key? key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: Text("FLUTTURA"),
          centerTitle: true,
          backgroundColor: const Color.fromRGBO(0, 0, 0, 0.867),
          shadowColor: Color.fromARGB(255, 255, 0, 0),
          elevation: 90,
        ),
        body: Form(
          key: formKey,
          child: Center(
            child: Container(
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 255, 255, 255),
                borderRadius: BorderRadius.all(Radius.circular(10)),
              ),
              height: 450,
              width: 450,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.network(
                    'https://cdn.dribbble.com/users/1889528/screenshots/7239609/media/9618c7e174ae3ddf8aed3322cb86008e.jpg',
                    height: 150,
                  ),
                  SizedBox(height: 0),
                  Column(
                    children: [
                      SizedBox(height: 10),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: TextFormField(
                          controller: _usernameController,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            hintText: 'Username',
                            prefixIcon: Icon(
                              Icons.person,
                              color: Colors.black,
                            ),
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Username is empty';
                            }
                            return null;
                          },
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: TextFormField(
                      controller: _passwordController,
                      obscureText: true,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: 'Password',
                        prefixIcon: Icon(
                          Icons.lock,
                          color: Colors.black,
                        ),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Password is empty';
                        }
                        return null;
                      },
                    ),
                  ),
                  SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      ElevatedButton.icon(
                        onPressed: () {
                          if (formKey.currentState!.validate()) {
                            checkLogin(context);
                          } else {
                            print('Data Empty');
                          }
                        },
                        icon: Icon(
                          Icons.check,
                        ),
                        label: Text(
                          'Login',
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
        backgroundColor: Color.fromARGB(255, 122, 19, 122),
      ),
    );
  }

  void checkLogin(BuildContext ctx) async {
    final _username = _usernameController.text;
    final _password = _passwordController.text;

    if (_username == _password) {
      print('Ready\nLoggedIn');

      final _sharedprefs = await SharedPreferences.getInstance();
      await _sharedprefs.setBool(SAVE_KEY_NAME, true);

      Navigator.of(ctx).pushReplacement(
        MaterialPageRoute(builder: (ctx1) => HomeScreen()),
      );
    } else {
      print("Username or password not match");
      showDialog(
        context: context,
        builder: (context1) {
          return AlertDialog(
            title: Text(
              'Ooops',
              style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold),
            ),
            content: Text('Enter Valid Password!'),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context1).pop();
                },
                child: Text('Close'),
              ),
            ],
          );
        },
      );
    }
  }
}
