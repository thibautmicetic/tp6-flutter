import 'package:flutter/material.dart';
import 'package:tp6/AppBar/appbar.dart';

import 'custom_icons.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int pageIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MainAppBar(
        title: 'Flutter demo',
        actions: [
          IconButton(
            icon: const Icon(Icons.abc),
            onPressed: () {},
          ),
        ],
      ),
      body: [
        const Center(
          child: Text('Accueil'),
        ),
        const Center(
          child: Text('Albums'),
        ),
        const Center(
          child: Text('Paramètres'),
        ),
      ][pageIndex],
      bottomNavigationBar: BottomNavigationBar(
        showUnselectedLabels: false,
        currentIndex: pageIndex,
        onTap: (value) {
          setState(() {
            pageIndex = value;
          });
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(CustomIcons.home),
            label: 'Accueil',
          ),
          BottomNavigationBarItem(
            icon: Icon(CustomIcons.note),
            label: 'Liste des albums',
          ),
          BottomNavigationBarItem(
            icon: Icon(CustomIcons.settings),
            label: 'Paramètres',
          ),
        ],
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
