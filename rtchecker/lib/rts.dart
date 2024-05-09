import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'userprofile.dart';
import 'main.dart';
import 'friends.dart';

class RoutinesDts extends StatefulWidget {
  const RoutinesDts({super.key, required this.title});

  final String title;

  @override
  State<RoutinesDts> createState() => MyRoutinesDts();
}

class MyRoutinesDts extends State<RoutinesDts> {
  double size = 50;
  int completed = 10;

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
            Text(
              '$completed %',
              style: const TextStyle(fontFamily: 'Changa', fontSize: 60),
            ),
            SizedBox(
              height: size,
              width: size,
            ),
            const Text('Tasks',
                style: TextStyle(fontFamily: 'BebasNeue', fontSize: 30)),
            const Divider(
              height: 10,
              thickness: 10,
            ),
            //Opcion de usar DataTable en vez de Column
            const Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  'Task 1: Mankeke chupalo',
                  style: TextStyle(fontFamily: 'BebasNeue', fontSize: 20),
                ),
                Text(
                  'Task 2: Martin chupalo',
                  style: TextStyle(fontFamily: 'BebasNeue', fontSize: 20),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}

class Routines extends StatefulWidget {
  const Routines({super.key, required this.title});

  final String title;

  @override
  State<Routines> createState() => MyRoutines();
}

class MyRoutines extends State<Routines> {
  double size = 50;
  int activeRts = 3; //Podria ser una lista

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
          Text(
            'Active Routines: $activeRts',
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontFamily: 'BebasNeue',
              fontSize: 30,
            ),
          ),
          Card(
              child: Padding(
            padding: const EdgeInsets.all(8),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                TextButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  RoutinesDts(title: 'Monster Hunter Rise')));
                    },
                    child: const Text('Monster Hunter Rise')),
                TextButton(onPressed: () {}, child: const Text('RTs 2')),
                TextButton(onPressed: () {}, child: const Text('Rts 3')),
              ],
            ),
          ))
        ]),
      )),
      floatingActionButton: FloatingActionButton(
          onPressed: () {},
          tooltip: 'Add Routine',
          child: const Icon(Icons.add)),
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
