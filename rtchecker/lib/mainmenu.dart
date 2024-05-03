import 'package:flutter/material.dart';
import 'user.dart';

class MainMenu extends StatelessWidget {
  const MainMenu({super.key});

  /*void _toRT() {}

  void _toGL() {}
  void _toFL() {}
*/
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('Main Menu'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text("el pepe"),
            const SizedBox(
              width: 20,
              height: 20,
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: ((context) => const User())));
              },
              child: const Text('User Profile'),
            )
          ],
        ),
      ),
      persistentFooterAlignment: AlignmentDirectional.bottomStart,
      persistentFooterButtons: <Widget>[
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('Go back'),
            )
          ],
        )
      ],
    );
  }
}
