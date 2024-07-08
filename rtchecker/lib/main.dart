import 'package:flutter/material.dart';
import 'dart:io';
import 'screens/home.dart';
import 'screens/games.dart';

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
        fontFamily: 'BebasNeue',
        colorScheme: ColorScheme.fromSeed(
            seedColor: const Color.fromARGB(255, 4, 59, 126)),
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
  double size = 100;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        const Text(
          'RT CHECKER APP',
          style: TextStyle(fontSize: 50),
        ),
        Container(
          color: const Color.fromARGB(255, 109, 245, 255),
          alignment: Alignment.center,
          height: 200,
          width: 200,
          child: Padding(
            padding: const EdgeInsets.all(8),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const GameDts(
                                    title: "My Game",
                                  )));
                    },
                    child: const Text(
                      'Start App',
                      style: TextStyle(fontSize: 40),
                    )),
                TextButton(
                    onPressed: () {
                      exit(0);
                    },
                    child: const Text(
                      'Quit',
                      style: TextStyle(fontSize: 40),
                    ))
              ],
            ),
          ),
        ),
      ]),
    ));
  }
}
