import 'dart:convert' as convert;
import 'package:flutter/services.dart' show rootBundle;
import 'package:flutter/material.dart';
import 'userprofile.dart';
import 'package:rtchecker/screens/games.dart';
import 'package:rtchecker/data/routines.dart';

//Pantalla inicial de rutinas
class Routines extends StatefulWidget {
  const Routines({super.key, required this.title});

  final String title;

  @override
  State<Routines> createState() => MyRoutines();
}

class MyRoutines extends State<Routines> {
  double size = 50;

  late Future<List<Routine>> routines;

  @override
  void initState() {
    super.initState();
    routines = loadRts();
  }

  Future<List<Routine>> loadRts() async {
    // Cargar el archivo JSON desde los assets
    String jsonText = await rootBundle.loadString('assets/json/rlist.json');
    List<dynamic> jsonList = convert.jsonDecode(jsonText);

    // Convertir cada elemento JSON en un objeto Routine y almacenarlo en la lista
    List<Routine> routinesList =
        jsonList.map((json) => Routine.fromJson(json)).toList();
    return routinesList;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 86, 19, 148),
        title: Text(
          widget.title,
          style: const TextStyle(color: Colors.white),
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
                BoxDecoration(color: const Color.fromARGB(255, 86, 19, 148)),
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
                    builder: (context) => const Routines(title: "My Routines")),
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
      body: FutureBuilder<List<Routine>>(
        future: routines,
        builder: (context, snapshot) {
          //para revisar errores
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else {
            List<Routine>? routinesList = snapshot.data;
            return ListView.builder(
              itemCount: routinesList!.length,
              itemBuilder: (context, index) {
                Routine routine = routinesList[index];
                return ListTile(
                  tileColor: routine.completedTasks()
                      ? const Color.fromARGB(255, 39, 255, 201)
                      : const Color.fromARGB(255, 38, 43, 41),
                  textColor: routine.completedTasks()
                      ? const Color.fromARGB(255, 38, 43, 41)
                      : Colors.white,
                  leading: Text(routine.gameName),
                  title: Text(routine.name),
                  subtitle: Text('Difficulty: ${routine.difficulty}'),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => ExRtsDts(rt: routine)),
                    );
                  },
                );
              },
            );
          }
        },
      ),
    );
  }
}

//Detalles extra rutinas
class ExRtsDts extends StatefulWidget {
  final Routine rt;

  const ExRtsDts({Key? key, required this.rt}) : super(key: key);

  @override
  ExRtsDtsState createState() => ExRtsDtsState();
}

class ExRtsDtsState extends State<ExRtsDts> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 86, 19, 148),
        title: Text(
          widget.rt.name,
          style: const TextStyle(color: Colors.white),
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
      body: Container(
        color: const Color.fromARGB(255, 39, 255, 201),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              padding: EdgeInsets.all(8),
              color: Color.fromARGB(255, 54, 85, 121),
              child: Column(
                children: [
                  Card(
                    color: const Color.fromARGB(255, 38, 43, 41),
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            'Objective: ${widget.rt.objective}',
                            style:
                                TextStyle(fontSize: 30.0, color: Colors.white),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Card(
                    color: const Color.fromARGB(255, 38, 43, 41),
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            widget.rt.description,
                            style:
                                TextStyle(fontSize: 20.0, color: Colors.white),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                'Task List',
                style: TextStyle(fontSize: 30, color: Colors.black),
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: widget.rt.tasks.length,
                itemBuilder: (context, index) {
                  Task task = widget.rt.tasks[index];
                  return CheckboxListTile(
                    title: Text(
                      task.taskName,
                      style: const TextStyle(
                        color: Colors.black,
                      ),
                    ),
                    value: task.status,
                    onChanged: (bool? value) {
                      setState(() {
                        task.status = value ?? false;
                      });
                    },
                  );
                },
              ),
            ),
            Container(
              padding: EdgeInsets.all(8),
              color: Color.fromARGB(255, 54, 85, 121),
              child: Column(
                children: <Widget>[
                  Text(
                    'Expected results: ${widget.rt.results}',
                    style: TextStyle(color: Colors.white, fontSize: 30),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
