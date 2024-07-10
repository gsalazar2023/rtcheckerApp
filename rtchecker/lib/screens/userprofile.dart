import 'package:flutter/material.dart';
import 'rts.dart';
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
          backgroundColor: const Color.fromARGB(255, 86, 19, 148),
          title: Text(
            widget.title,
            style: TextStyle(color: Colors.white),
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
                      builder: (context) => Routines(title: "My Routines")),
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
          child: Center(
            child: Container(
              color: const Color.fromARGB(255, 39, 255, 201),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Column(
                    children: [
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
                    ],
                  ),
                  SizedBox(
                    height: size,
                    width: size,
                  ),
                  Text(
                    user.userName,
                    style:
                        const TextStyle(fontFamily: 'BebasNeue', fontSize: 20),
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
                                style: TextStyle(
                                    fontFamily: 'BebasNeue', fontSize: 20),
                              )),
                          TextButton(
                              onPressed: () {
                                //Cambiar contraseña usuario
                              },
                              child: const Text(
                                'Change Password',
                                style: TextStyle(
                                    fontFamily: 'BebasNeue', fontSize: 20),
                              ))
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ));
  }
}
