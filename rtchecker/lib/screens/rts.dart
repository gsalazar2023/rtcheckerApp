import 'dart:convert' as convert;
import 'package:flutter/services.dart' show rootBundle;
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'userprofile.dart';
import 'friends.dart';
import 'package:rtchecker/screens/games.dart';
import 'package:rtchecker/data/routines.dart';

/*Future<List<Routine>> loadRts() async {
  String jsonString = await rootBundle.loadString('assets/json/glist.json');
  List<dynamic> jsonData = convert.jsonDecode(jsonString);

  List<Routine> rts = jsonData.map((json) => Routine.fromJson(json)).toList();
  return rts;
}*/

class Routines extends StatefulWidget {
  const Routines({super.key, required this.title});

  final String title;

  @override
  State<Routines> createState() => MyRoutines();
}

class MyRoutines extends State<Routines> {
  double size = 50;

  late List<Routine> routines;

  @override
  void initState() {
    super.initState();
    loadRts();
  }

  Future<void> loadRts() async {
    // Cargar el archivo JSON desde los assets
    String jsonText = await rootBundle.loadString('assets/json/rlist.json');
    List<dynamic> jsonList = convert.jsonDecode(jsonText);

    // Convertir cada elemento JSON en un objeto Routine y almacenarlo en la lista
    setState(() {
      routines = jsonList.map((json) => Routine.fromJson(json)).toList();
    });
  }

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
      body: routines == null
          ? Center(child: CircularProgressIndicator())
          : ListView.builder(
              itemCount: routines.length,
              itemBuilder: (context, index) {
                Routine routine = routines[index];
                return ListTile(
                  title: Text(routine.name),
                  subtitle: Text('Difficulty: ${routine.difficulty}'),
                  onTap: () {
                    // Navegar a una nueva pantalla para mostrar detalles de la rutina
                  },
                );
              },
            ),
    );
  }
}
