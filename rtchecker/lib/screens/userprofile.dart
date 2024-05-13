import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'rts.dart';
import 'friends.dart';
import 'package:rtchecker/screens/games.dart';
import 'package:rtchecker/data/user.dart';
import 'package:rtchecker/data/player.dart';

class User extends StatefulWidget {
  const User({super.key, required this.title});

  final String title;

  @override
  State<User> createState() => MyProfile();
}

class MyProfile extends State<User> {
  Player player = Player(['playerNicks'], 'useremail1@gmail.com');
  double size = 50;

  AppUser user = AppUser('', 0, 123, ['usernick']);
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
                child: IconButton(
                  onPressed: () {
                    //Cambiar icono usuario
                  },
                  icon: const Icon(
                    Icons.account_box,
                    size: 50,
                  ),
                ),
              ),
            ),
            const Text(
              'Change Icon',
              style: TextStyle(fontFamily: 'BebasNeue', fontSize: 20),
            ),
            SizedBox(
              height: size,
              width: size,
            ),
            Text(
              user.userName,
              style: const TextStyle(fontFamily: 'BebasNeue', fontSize: 20),
            ),
            Text(
              '# ${user.userID}',
              style: const TextStyle(fontFamily: 'Changa', fontSize: 20),
            ),
            Text(
              '${user.userNicks[0]}',
              style: const TextStyle(fontFamily: 'Changa', fontSize: 20),
            ),
            Text(
              player.playerEmail,
              style: const TextStyle(fontFamily: 'Changa', fontSize: 20),
            ),
            Card(
              child: Padding(
                padding: const EdgeInsets.all(8),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    //Usar TextField para cambio de nombres y contraseñas
                    TextButton(
                        onPressed: () {
                          //Cambiar nombre usuario
                        },
                        child: const Text(
                          'Change Username',
                          style:
                              TextStyle(fontFamily: 'BebasNeue', fontSize: 20),
                        )),
                    TextButton(
                        onPressed: () {
                          //Cambiar contraseña usuario
                        },
                        child: const Text(
                          'Change Password',
                          style:
                              TextStyle(fontFamily: 'BebasNeue', fontSize: 20),
                        ))
                  ],
                ),
              ),
            )
          ],
        ),
      ),
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
