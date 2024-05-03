import 'dart:io';

import 'package:flutter/material.dart';
import 'mainmenu.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme:
            ColorScheme.fromSeed(seedColor: Color.fromARGB(255, 103, 232, 47)),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'RT Checker App'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  //void _tooptions() {}

  void _tomainapp() {
    Navigator.push(
        context, MaterialPageRoute(builder: ((context) => MainMenu())));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const Text(
                'Welcome to RT Checker',
                style: TextStyle(fontSize: 30),
              ),
              const SizedBox(
                width: 20,
                height: 20,
              ),
              ElevatedButton(
                onPressed: _tomainapp,
                child: const Text('Main Menu'),
              ),
              const SizedBox(
                width: 20,
                height: 20,
              ),
              ElevatedButton(
                  onPressed: () => exit(0), child: const Text('Exit')),
            ]),
      ),
    );
  }
}
