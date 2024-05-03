import 'package:flutter/material.dart';

class User extends StatefulWidget {
  const User({super.key}); //atributos

  @override
  State<User> createState() => _UserState();
}

class _UserState extends State<User> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('User Profile'),
      ),
    );
  }
}
