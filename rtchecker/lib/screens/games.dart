import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'friends.dart';
import 'rts.dart';
import 'userprofile.dart';
import 'package:rtchecker/data/game.dart';

class Game1 extends StatelessWidget {
  Game1({super.key});

  final List<Game> games = [
    Game('Monster Hunter Rise', 'Game Desc', ['Single', 'Multiplayer'], 1),
  ];
  @override
  Widget build(BuildContext context) {
    Game? firstGame = games.isNotEmpty ? games.first : null;
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            const SizedBox(
              height: 50,
            ),
            Column(
              children: [
                Card(
                  child: Padding(
                    padding: EdgeInsets.all(8),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SvgPicture.asset(
                          'assets/icons/mhrise.svg',
                          height: 200,
                          width: 300,
                        ),
                      ],
                    ),
                  ),
                ),
                const Divider(
                  thickness: 10,
                ),
                firstGame != null
                    ? Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            firstGame.gameName,
                            style: TextStyle(fontSize: 30),
                          ),
                          Text(
                            '\nDescription: \n${firstGame.gameDesx}',
                            style: const TextStyle(fontSize: 30),
                          ),
                          Text(
                            'Player Mode: ${firstGame.gameMode.join('-')}',
                            style: const TextStyle(fontSize: 30),
                          ),
                          Text(
                            'Routines: ${firstGame.activeRts}',
                            style: const TextStyle(fontSize: 30),
                          ),
                        ],
                      )
                    : const Text('No Game Found'),
                TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child:
                        const Text('Go back', style: TextStyle(fontSize: 30))),
                TextButton(
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => Rts1()));
                    },
                    child: const Text('Go to Routine',
                        style: TextStyle(fontSize: 30)))
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class Game2 extends StatelessWidget {
  Game2({super.key});

  final List<Game> games = [
    Game('Game 2', 'Game Desc', ['Single'], 1)
  ];
  @override
  Widget build(BuildContext context) {
    Game? firstGame = games.isNotEmpty ? games.first : null;
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            const SizedBox(
              height: 50,
            ),
            Column(
              children: [
                const Card(
                  child: Padding(
                    padding: EdgeInsets.all(8),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.add_box,
                          size: 200,
                        ),
                      ],
                    ),
                  ),
                ),
                const Divider(
                  thickness: 10,
                ),
                firstGame != null
                    ? Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            firstGame.gameName,
                            style: TextStyle(fontSize: 30),
                          ),
                          Text(
                            '\nDescription: \n${firstGame.gameDesx}',
                            style: const TextStyle(fontSize: 30),
                          ),
                          Text(
                            'Player Mode: ${firstGame.gameMode.join('-')}',
                            style: const TextStyle(fontSize: 30),
                          ),
                          Text(
                            'Routines: ${firstGame.activeRts}',
                            style: const TextStyle(fontSize: 30),
                          ),
                        ],
                      )
                    : const Text('No Game Found'),
                TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child:
                        const Text('Go back', style: TextStyle(fontSize: 30))),
                TextButton(
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => Rts2()));
                    },
                    child: const Text('Go to Routine',
                        style: TextStyle(fontSize: 30))),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class Game3 extends StatelessWidget {
  Game3({super.key});

  final List<Game> games = [
    Game('Game 3', 'Game Desc', ['Multiplayer'], 0)
  ];
  @override
  Widget build(BuildContext context) {
    Game? firstGame = games.isNotEmpty ? games.first : null;
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            const SizedBox(
              height: 50,
            ),
            Column(
              children: [
                const Card(
                  child: Padding(
                    padding: EdgeInsets.all(8),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [Icon(Icons.abc, size: 200)],
                    ),
                  ),
                ),
                const Divider(
                  thickness: 10,
                ),
                firstGame != null
                    ? Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            firstGame.gameName,
                            style: const TextStyle(fontSize: 30),
                          ),
                          Text(
                            '\nDescription: \n${firstGame.gameDesx}',
                            style: const TextStyle(fontSize: 30),
                          ),
                          Text(
                            'Player Mode: ${firstGame.gameMode.join('-')}',
                            style: const TextStyle(fontSize: 30),
                          ),
                          Text(
                            'Routines: ${firstGame.activeRts}',
                            style: const TextStyle(fontSize: 30),
                          ),
                        ],
                      )
                    : const Text('No Game Found'),
                TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child:
                        const Text('Go back', style: TextStyle(fontSize: 30)))
              ],
            ),
          ],
        ),
      ),
    );
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
  //Incluir como Lista
  List<Game> games = [
    Game('Monster Hunter Rise', 'Game Desc', ['Single', 'Multiplayer'], 1),
    Game('Game 2', 'Game Desc', ['Single'], 1),
    Game('Game 3', 'Game Desc', ['Multiplayer'], 0)
  ];

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
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SizedBox(
              height: 200,
              child: ListView.builder(
                scrollDirection: Axis.vertical,
                itemCount: games.length,
                itemBuilder: (BuildContext context, int index) {
                  return ListTile(
                      title: TextButton(
                          onPressed: () {
                            if (games[index].gameName ==
                                'Monster Hunter Rise') {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: ((context) => Game1())));
                            } else if (games[index].gameName == 'Game 2') {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: ((context) => Game2())));
                            } else if (games[index].gameName == 'Game 3') {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: ((context) => Game3())));
                            }
                          },
                          child: Text(
                            games[index].gameName,
                            style: const TextStyle(fontSize: 30),
                          )));
                },
              ),
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: () {},
          tooltip: 'Add Friend',
          child: const Icon(Icons.add)),
      persistentFooterAlignment: AlignmentDirectional.center,
      persistentFooterButtons: [
        Column(
          children: [
            IconButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: ((context) => const GameDts(
                                title: 'My Games',
                              ))));
                },
                icon: SvgPicture.asset(
                  'assets/icons/game.svg',
                  width: 40,
                  height: 40,
                )),
            const Text(
              'Games',
              style: TextStyle(fontSize: 20),
            )
          ],
        ),
        Column(
          children: [
            IconButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: ((context) => const Routines(
                                title: 'My Routines',
                              ))));
                },
                icon: const Icon(
                  Icons.list_rounded,
                  size: 40,
                )),
            const Text(
              'Routines',
              style: TextStyle(fontSize: 20),
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
                          builder: ((context) => const User(
                                title: 'Profile',
                              ))));
                },
                icon: const Icon(
                  Icons.account_box_rounded,
                  size: 40,
                )),
            const Text(
              'Profile',
              style: TextStyle(fontSize: 20),
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
                          builder: ((context) => const FriendList(
                                title: 'Friend List',
                              ))));
                },
                icon: const Icon(
                  Icons.book_rounded,
                  size: 40,
                )),
            const Text(
              'Friends',
              style: TextStyle(fontSize: 20),
            ),
          ],
        )
      ],
    );
  }
}
