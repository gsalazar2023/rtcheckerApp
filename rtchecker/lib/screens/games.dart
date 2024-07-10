import 'dart:convert' as convert;
import 'package:flutter/services.dart' show rootBundle;
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_svg/svg.dart';
import 'rts.dart';
import 'userprofile.dart';
import 'package:rtchecker/data/game.dart';

Future<List<Game>> loadGame() async {
  String jsonString = await rootBundle.loadString('assets/json/glist.json');
  List<dynamic> jsonData = convert.jsonDecode(jsonString);

  List<Game> games = jsonData.map((json) => Game.fromJson(json)).toList();
  return games;
}

//Detalles extra de juegos
class ExGameDts extends StatelessWidget {
  const ExGameDts({super.key, required this.game});

  final Game game;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 86, 19, 148),
        title: Text(game.name, style: const TextStyle(color: Colors.white)),
        centerTitle: true,
        actions: <Widget>[
          IconButton(
            onPressed: () {},
            tooltip: 'Search',
            icon: const Icon(Icons.search),
          ),
        ],
      ),
      body: Container(
        color: Color.fromARGB(255, 39, 255, 201),
        child: Center(
          child: Column(
            children: [
              Card(
                color: Color.fromARGB(255, 38, 43, 41),
                child: Padding(
                  padding: const EdgeInsetsDirectional.only(start: 20.0),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        SvgPicture.asset(
                          game.icon,
                          width: 150,
                          height: 150,
                        ),
                      ]),
                ),
              ),
              Container(
                color: Color.fromARGB(255, 32, 83, 63),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text.rich(
                      softWrap: true,
                      TextSpan(
                          text: 'Game Genre: \n',
                          style: const TextStyle(
                              fontSize: 18, color: Colors.white),
                          children: game.genre.map((genre) {
                            return TextSpan(
                              text: '$genre ',
                              style: const TextStyle(color: Colors.white),
                            );
                          }).toList()),
                    ),
                    const SizedBox(
                      width: 5.0,
                    ),
                    Text.rich(
                      softWrap: true,
                      TextSpan(
                          text: 'Game Mode: \n',
                          style: const TextStyle(
                              fontSize: 18, color: Colors.white),
                          children: game.gameMode.map((gamemode) {
                            return TextSpan(
                              text: '$gamemode ',
                              style: const TextStyle(color: Colors.white),
                            );
                          }).toList()),
                    ),
                    const SizedBox(
                      width: 5.0,
                    ),
                    Text(
                      softWrap: true,
                      'Ranking: \n ${game.ranking}',
                      style: const TextStyle(fontSize: 18, color: Colors.white),
                    ),
                  ],
                ),
              ),
              Card(
                  color: Color.fromARGB(255, 38, 43, 41),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          game.description,
                          style: const TextStyle(
                              fontSize: 30.0,
                              color: Colors.white,
                              fontWeight: FontWeight.normal),
                        )
                      ],
                    ),
                  ))
            ],
          ),
        ),
      ),
      persistentFooterAlignment: AlignmentDirectional.center,
      persistentFooterButtons: <Widget>[
        TextButton(
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: ((context) =>
                          const Routines(title: 'My Routines'))));
            },
            child: const Text(
              "Go to Routine's Page",
              style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
            ))
      ],
    );
  }
}

//Pantalla inicial de juegos
class GameDts extends StatefulWidget {
  const GameDts({super.key, required this.title});

  final String title;

  @override
  State<GameDts> createState() => MyGameDts();
}

class MyGameDts extends State<GameDts> {
  double size = 50;
  late Future<List<Game>> _gameFt;

  @override
  void initState() {
    super.initState();
    _gameFt = loadGame();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: const Color.fromARGB(255, 86, 19, 148),
          title: Text(
            widget.title,
            style: const TextStyle(color: Colors.white),
          ),
          centerTitle: true,
          actions: <Widget>[
            IconButton(
              onPressed: () {},
              tooltip: 'Search',
              icon: const Icon(Icons.search),
            ),
          ],
        ),
        drawer: Drawer(
            child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration:
                  BoxDecoration(color: Color.fromARGB(255, 86, 19, 148)),
              child: Text("Menu",
                  style: const TextStyle(color: Colors.white, fontSize: 40)),
            ),
            ListTile(
              title: const Text('Close Menu'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: const Text('Games'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const GameDts(title: "My Games")),
                );
              },
            ),
            ListTile(
              title: const Text('Routines'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          const Routines(title: "My Routines")),
                );
              },
            ),
            ListTile(
              title: const Text('User Profile'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const User(title: "My Profile")),
                );
              },
            )
          ],
        )),
        body: Container(
            color: Color.fromARGB(255, 38, 43, 41),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                FutureBuilder<List<Game>>(
                  future: _gameFt,
                  builder: (context, snapshot) {
                    //para revisar si hay algun error
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return Center(child: CircularProgressIndicator());
                    } else if (snapshot.hasError) {
                      return Center(child: Text('Error al cargar los juegos'));
                    } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                      return Center(child: Text('No se encontraron juegos'));
                    } else {
                      return GridView.builder(
                        shrinkWrap: true,
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          mainAxisSpacing: 10.0,
                          crossAxisSpacing: 10.0,
                          childAspectRatio: 1.0,
                        ),
                        itemCount: snapshot.data!.length,
                        itemBuilder: (context, index) {
                          Game game = snapshot.data![index];
                          return GestureDetector(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => ExGameDts(
                                            game: game,
                                          )));
                            },
                            child: Card(
                              color: Color.fromARGB(255, 39, 255, 201),
                              elevation: 2.0,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  SvgPicture.asset(
                                    game.icon,
                                    width: 100,
                                    height: 100,
                                  ),
                                  const SizedBox(height: 10),
                                  Text(
                                    game.name,
                                    textAlign: TextAlign.center,
                                    style: const TextStyle(fontSize: 20),
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      );
                    }
                  },
                ),
              ],
            )));
  }
}
