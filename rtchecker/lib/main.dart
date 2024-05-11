import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'friends.dart';
import 'rts.dart';
import 'userprofile.dart';
import 'games.dart';

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
        colorScheme:
            ColorScheme.fromSeed(seedColor: Color.fromARGB(255, 4, 59, 126)),
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
  List<String> gameTitles = ['Monster Hunter Rise', 'Game 1', 'Game 2'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
        actions: <Widget>[
          IconButton(
            onPressed: () {},
            tooltip: 'Search',
            icon: const Icon(Icons.search),
          ),
        ],
      ),
      body: Center(
          child: Container(
        padding: const EdgeInsets.fromLTRB(50, 50, 50, 50),
        color: const Color.fromARGB(255, 208, 214, 255),
        child: ListView(padding: const EdgeInsets.all(4), children: <Widget>[
          SizedBox(
            height: size,
            width: size,
          ),
          Card(
              child: Padding(
            padding: const EdgeInsets.all(8),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    ListView.builder(
                      scrollDirection: Axis.vertical,
                      shrinkWrap: true,
                      itemCount: gameTitles.length,
                      itemBuilder: ((context, index) {
                        return ListTile(
                          title: TextButton(
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => const GameDts(
                                            title: 'games',
                                          )));
                            },
                            child: Text(gameTitles[index]),
                          ),
                        );
                      }),
                    )
                  ],
                )
              ],
            ),
          ))
        ]),
      )),
      floatingActionButton: FloatingActionButton(
          onPressed: () {}, tooltip: 'Add Game', child: const Icon(Icons.add)),
      persistentFooterAlignment: AlignmentDirectional.bottomCenter,
      persistentFooterButtons: <Widget>[
        Column(
          children: [
            IconButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const User(title: 'Profile')));
              },
              tooltip: 'Profile',
              icon: const Icon(Icons.account_circle),
              alignment: Alignment.bottomLeft,
            ),
            const SizedBox(
              height: 2,
            ),
            const Text(
              'Profile',
              style: TextStyle(fontFamily: 'Changa', fontSize: 15),
            ),
          ],
        ),
        Column(
          children: [
            IconButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            const Routines(title: 'My Routines')));
              },
              tooltip: 'Routines',
              icon: const Icon(Icons.list),
              alignment: Alignment.bottomCenter,
            ),
            const SizedBox(
              height: 2,
            ),
            const Text(
              'Routines',
              style: TextStyle(fontFamily: 'Changa', fontSize: 15),
            ),
          ],
        ),
        Column(
          children: [
            IconButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => const MyApp()));
                },
                tooltip: 'Games',
                icon: SvgPicture.asset('assets/icons/game.svg')),
            const SizedBox(
              height: 2,
            ),
            const Text(
              'Games',
              style: TextStyle(fontFamily: 'Changa', fontSize: 15),
            ),
          ],
        ),
        Column(
          children: [
            IconButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            const FriendList(title: 'My Friend List')));
              },
              tooltip: 'Friend List',
              icon: const Icon(Icons.book),
              alignment: Alignment.bottomRight,
            ),
            const SizedBox(
              height: 2,
            ),
            const Text(
              'Friends',
              style: TextStyle(fontFamily: 'Changa', fontSize: 15),
            ),
          ],
        ),
      ],
    );
  }
}
