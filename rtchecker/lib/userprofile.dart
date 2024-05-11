import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'rts.dart';
import 'main.dart';
import 'friends.dart';

class AppUser {
  String userName = '';
  int userPasswrd = 0;
  int userID = 0;
  var gameNicks = [];

  AppUser(this.userName, this.userPasswrd, this.userID, this.gameNicks);
}

class User extends StatefulWidget {
  const User({super.key, required this.title});

  final String title;

  @override
  State<User> createState() => MyProfile();
}

class MyProfile extends State<User> {
  double size = 50;
  AppUser user = AppUser('', 0, 123, ['']);
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
            const Text(
              //{user.userName},
              'User',
              style: TextStyle(fontFamily: 'BebasNeue', fontSize: 20),
            ),
            Text(
              '# ${user.userID}',
              style: const TextStyle(fontFamily: 'Changa', fontSize: 20),
            ),
            Card(
              child: Padding(
                padding: EdgeInsets.all(8),
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
