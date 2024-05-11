import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'friends.dart';
import 'rts.dart';
import 'userprofile.dart';
import 'main.dart';

class Game {
  String gameName = '';
  String gameDesx = '';
  var gameMode = [];
  int activeRts = 0;

  Game(this.gameName, this.gameDesx, this.gameMode, this.activeRts);

  void addGame() {}

  void deleteGame() {}
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
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            SizedBox(
              height: size,
              width: size,
            ),
            Card(
              child: Padding(
                padding: const EdgeInsets.all(8),
                child: SvgPicture.asset('assets/icons/mhrise.svg'),
              ),
            ),
            SizedBox(
              height: size,
              width: size,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                ListView.builder(
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  itemCount: games.length,
                  itemBuilder: ((context, index) {
                    return ListTile(
                      title: Text(games[index].gameName),
                    );
                  }),
                )
              ],
            )
          ],
        ),
      ),
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
