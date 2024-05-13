import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'userprofile.dart';
import 'friends.dart';
import 'package:rtchecker/screens/games.dart';
import 'package:rtchecker/data/routines.dart';

class Rts1 extends StatelessWidget {
  Rts1({super.key});

  final List<Rts> rts = [
    Rts('Practice Double Blades', 'Get better at quick damage',
        ['Practice every 10 min at X Map', 'Forge Better Weapons'], 10),
  ];
  @override
  Widget build(BuildContext context) {
    Rts? firstRts = rts.isNotEmpty ? rts.first : null;
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
                firstRts != null
                    ? Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            firstRts.rtsName,
                            style: const TextStyle(fontSize: 30),
                          ),
                          Text(
                            '\nDescription: \n${firstRts.rtsDesc}',
                            style: const TextStyle(fontSize: 30),
                          ),
                          Text(
                            'Tasks:\n ${firstRts.rtsTask.join('\n')}',
                            style: const TextStyle(fontSize: 30),
                          ),
                          Text(
                            'Status: ${firstRts.status} %',
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

class Rts2 extends StatelessWidget {
  Rts2({super.key});

  final List<Rts> rts = [
    Rts('Practice Dodging', 'Get better at dodging using X character',
        ['Play Ranked', 'Practice X thing'], 50)
  ];
  @override
  Widget build(BuildContext context) {
    Rts? firstRts = rts.isNotEmpty ? rts.first : null;
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
                        )
                      ],
                    ),
                  ),
                ),
                const Divider(
                  thickness: 10,
                ),
                firstRts != null
                    ? Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            firstRts.rtsName,
                            style: const TextStyle(fontSize: 30),
                          ),
                          Text(
                            '\nDescription: \n${firstRts.rtsDesc}',
                            style: const TextStyle(fontSize: 30),
                          ),
                          Text(
                            'Tasks:\n ${firstRts.rtsTask.join('\n')}',
                            style: const TextStyle(fontSize: 30),
                          ),
                          Text(
                            'Status: ${firstRts.status} %',
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

class Routines extends StatefulWidget {
  const Routines({super.key, required this.title});

  final String title;

  @override
  State<Routines> createState() => MyRoutines();
}

class MyRoutines extends State<Routines> {
  double size = 50;
  int activeRts = 2; //Podria ser una lista
  List<Rts> rts = [
    Rts('Practice Double Blades', 'Get better at quick damage',
        ['Practice every 10 min at X Map', 'Forge Better Weapons'], 10),
    Rts('Practice Dodging', 'Get better at dodging using X character',
        ['Play Ranked', 'Practice X thing'], 50)
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
                itemCount: rts.length,
                itemBuilder: (BuildContext context, int index) {
                  return ListTile(
                      title: TextButton(
                          onPressed: () {
                            if (rts[index].rtsName ==
                                'Practice Double Blades') {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: ((context) => Rts1())));
                            } else if (rts[index].rtsName ==
                                'Practice Dodging') {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: ((context) => Rts2())));
                            }
                          },
                          child: Text(
                            rts[index].rtsName,
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
          tooltip: 'Add Routine',
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
                          builder: ((context) => GameDts(
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
                          builder: ((context) => Routines(
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
                          builder: ((context) => User(
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
                          builder: ((context) => FriendList(
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
