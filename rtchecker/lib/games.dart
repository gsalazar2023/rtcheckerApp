import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'friends.dart';
import 'rts.dart';
import 'userprofile.dart';
import 'main.dart';

class GameDts extends StatefulWidget {
  const GameDts({super.key, required this.title});

  final String title;

  @override
  State<GameDts> createState() => MyGameDts();
}

class MyGameDts extends State<GameDts> {
  double size = 50;
  //Incluir como Lista

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
            const Text(
              'Monster Hunter Rise',
              style: TextStyle(fontFamily: 'Changa', fontSize: 40),
            ),
            SizedBox(
              height: size,
              width: size,
            ),
            const Text('Details',
                style: TextStyle(fontFamily: 'BebasNeue', fontSize: 30)),
            const Divider(
              height: 10,
              thickness: 10,
            ),
            const Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  'Genre: Action Role-Playing',
                  style: TextStyle(fontFamily: 'BebasNeue', fontSize: 20),
                ),
                //Incluir como bool isCoop: true/false
                Text(
                  'Mode: Single Player/Multiplayer',
                  style: TextStyle(fontFamily: 'BebasNeue', fontSize: 20),
                ),
              ],
            )
          ],
        ),
      ),
      persistentFooterAlignment: AlignmentDirectional.bottomCenter,
      persistentFooterButtons: <Widget>[
        //Perfil Usuario
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

        //Rutinas
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

        //Pagina Principal/Juegos
        IconButton(
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const MyApp()));
            },
            tooltip: 'Games',
            icon: SvgPicture.asset('assets/icons/game.svg')),

        //Lista de Amigos
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
      ],
    );
  }
}
