import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'rts.dart';
import 'main.dart';
import 'friends.dart';

class User extends StatefulWidget {
  const User({super.key, required this.title});

  final String title;

  @override
  State<User> createState() => MyProfile();
}

class MyProfile extends State<User> {
  double size = 50;
  String username = 'User';
  String password = '';
  int userID = 123456789;

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
              'User',
              style: TextStyle(fontFamily: 'BebasNeue', fontSize: 20),
            ),
            Text(
              '# $userID',
              style: const TextStyle(fontFamily: 'Changa', fontSize: 20),
            ),
            TextButton(
                onPressed: () {
                  //Cambiar nombre usuario
                },
                child: const Text(
                  'Change Username',
                  style: TextStyle(fontFamily: 'BebasNeue', fontSize: 20),
                )),
            TextButton(
                onPressed: () {
                  //Cambiar contraseña usuario
                },
                child: const Text(
                  'Change Password',
                  style: TextStyle(fontFamily: 'BebasNeue', fontSize: 20),
                ))
          ],
        ),
      ),
      persistentFooterAlignment: AlignmentDirectional.bottomCenter,
      persistentFooterButtons: <Widget>[
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
        IconButton(
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const MyApp()));
            },
            tooltip: 'Games',
            icon: SvgPicture.asset('assets/icons/game.svg')),
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
