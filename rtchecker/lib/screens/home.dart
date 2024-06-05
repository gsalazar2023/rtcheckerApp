import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:rtchecker/screens/friends.dart';
import 'package:rtchecker/screens/games.dart';
import 'package:rtchecker/screens/rts.dart';
import 'package:rtchecker/screens/userprofile.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        centerTitle: true,
        title: const Text('Main Menu'),
        actions: [
          IconButton(
            onPressed: () {},
            tooltip: 'Search',
            icon: const Icon(Icons.search),
          ),
        ],
      ),
      body: Container(
        padding: const EdgeInsets.all(10.0),
        child: GridView.count(
            crossAxisCount: 2, // columnas cuadricula
            crossAxisSpacing: 50.0, // espacio columnas
            mainAxisSpacing: 50.0, // espacio filas
            children: <Widget>[
              Container(
                color: Colors.blue,
                child: Center(
                    child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
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
                          width: 50,
                          height: 50,
                        )),
                    const Text(
                      'Games',
                      style: TextStyle(fontSize: 30),
                    )
                  ],
                )),
              ),
              Container(
                color: Colors.blue,
                child: Center(
                    child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
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
                          size: 50,
                        )),
                    const Text(
                      'Routines',
                      style: TextStyle(fontSize: 30),
                    ),
                  ],
                )),
              ),
              Container(
                color: Colors.blue,
                child: Center(
                    child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
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
                          size: 50,
                        )),
                    const Text(
                      'Profile',
                      style: TextStyle(fontSize: 30),
                    )
                  ],
                )),
              ),
              Container(
                color: Colors.blue,
                child: Center(
                    child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
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
                          size: 50,
                        )),
                    const Text(
                      'Friends',
                      style: TextStyle(fontSize: 30),
                    )
                  ],
                )),
              ),
            ]),
      ),

      //PersistentFooter
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
