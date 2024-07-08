import 'dart:convert' as convert;
import 'package:flutter/services.dart' show rootBundle;
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_svg/svg.dart';
import 'friends.dart';
import 'rts.dart';
import 'userprofile.dart';
import 'package:rtchecker/data/game.dart';

Future<List<Game>> loadGame() async {
  String jsonString = await rootBundle.loadString('assets/json/glist.json');
  List<dynamic> jsonData = convert.jsonDecode(jsonString);

  List<Game> games = jsonData.map((json) => Game.fromJson(json)).toList();
  return games;
}

class ExGameDts extends StatelessWidget {
  const ExGameDts({super.key, required this.game});

  final Game game;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: Text(game.name),
          centerTitle: true,
          actions: <Widget>[
            IconButton(
              onPressed: () {},
              tooltip: 'Search',
              icon: const Icon(Icons.search),
            ),
          ],
        ),
        body: Center(
          child: Column(
            children: [
              Card(
                child: Padding(
                  padding: EdgeInsetsDirectional.only(start: 20.0),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        SvgPicture.asset(
                          game.icon,
                          width: 200,
                          height: 200,
                        ),
                      ]),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text.rich(
                    TextSpan(
                        text: 'Game Genre: \n',
                        style: TextStyle(fontSize: 24),
                        children: game.genre.map((genre) {
                          return TextSpan(
                            text: '$genre, ',
                            style: TextStyle(color: Colors.blue),
                          );
                        }).toList()),
                  ),
                  SizedBox(
                    width: 20.0,
                  ),
                  Text.rich(
                    TextSpan(
                        text: 'Game Mode: \n',
                        style: TextStyle(fontSize: 24),
                        children: game.gameMode.map((gamemode) {
                          return TextSpan(
                            text: '$gamemode, ',
                            style: TextStyle(color: Colors.blue),
                          );
                        }).toList()),
                  ),
                  SizedBox(
                    width: 20.0,
                  ),
                  Text(
                    'Ranking: \n ${game.ranking}',
                    style: TextStyle(fontSize: 24),
                  ),
                ],
              )
            ],
          ),
        ));
  }
}

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
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: Text(widget.title),
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
            color: Color.fromARGB(255, 38, 43, 41),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                FutureBuilder<List<Game>>(
                  future: _gameFt,
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return Center(child: CircularProgressIndicator());
                    } else if (snapshot.hasError) {
                      return Center(child: Text('Error al cargar los juegos'));
                    } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                      return Center(child: Text('No se encontraron juegos'));
                    } else {
                      return GridView.builder(
                        shrinkWrap: true,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
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
                                  SizedBox(height: 10),
                                  Text(
                                    game.name,
                                    textAlign: TextAlign.center,
                                    style: TextStyle(fontSize: 20),
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

/*
FutureBuilder<List<Game>>(
        future: _gameFt,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error al cargar los juegos'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return Center(child: Text('No se encontraron juegos'));
          } else {
            return GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
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
                    // Implementa la acción al hacer tap en un juego si es necesario
                  },
                  child: Card(
                    elevation: 2.0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        SvgPicture.asset(
                          game.icon,
                          width: 80,
                          height: 80,
                        ),
                        SizedBox(height: 10),
                        Text(
                          game.name,
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 16),
                        ),
                      ],
                    ),
                  ),
                );
              },
            );
          }
        },
      ), */