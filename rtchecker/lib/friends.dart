import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'userprofile.dart';
import 'rts.dart';
import 'main.dart';

class Friends {
  String name = '';
  int friendId = 0;

  Friends(this.name, this.friendId);

  void addFriend() {}
  void deleteFriend() {}
}

class FriendList extends StatefulWidget {
  const FriendList({super.key, required this.title});

  final String title;

  @override
  State<FriendList> createState() => MyFriendList();
}

class MyFriendList extends State<FriendList> {
  double size = 50;

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
          child: Container(
        padding: const EdgeInsets.fromLTRB(50, 50, 50, 50),
        color: const Color.fromARGB(255, 208, 214, 255),
        child: ListView(padding: const EdgeInsets.all(4), children: <Widget>[
          SizedBox(
            height: size,
            width: size,
          ),
          Card(
              child: Padding(
            padding: const EdgeInsets.all(8),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                TextButton(onPressed: () {}, child: const Text('Friend 1')),
                TextButton(onPressed: () {}, child: const Text('Friend 2')),
                TextButton(onPressed: () {}, child: const Text('Friend 3')),
              ],
            ),
          ))
        ]),
      )),
      floatingActionButton: FloatingActionButton(
          onPressed: () {},
          tooltip: 'Add Friend',
          child: const Icon(Icons.add)),
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
