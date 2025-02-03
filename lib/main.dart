import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:json_theme/json_theme.dart';
import 'package:tp6/AppBar/appbar.dart';
import 'package:tp6/albums.dart';
import 'package:tp6/errorPage.dart';
import 'package:tp6/infoAlbum.dart';
import 'package:tp6/settings.dart';

import 'custom_icons.dart';
import 'home.dart';

class ThemeController extends ValueNotifier<ThemeMode> {
  ThemeController() : super(ThemeMode.light);

  void toggleTheme() {
    value = value == ThemeMode.light ? ThemeMode.dark : ThemeMode.light;
  }
}

final themeController = ThemeController();

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final lightThemeStr = await rootBundle.loadString('themeAlbum.json');
  final lightThemeJson = jsonDecode(lightThemeStr);
  final lightTheme = ThemeDecoder.decodeThemeData(lightThemeJson)!;

  final darkThemeStr = await rootBundle.loadString('themeAlbum_dark.json');
  final darkThemeJson = jsonDecode(darkThemeStr);
  final darkTheme = ThemeDecoder.decodeThemeData(darkThemeJson)!.copyWith();

  runApp(MyApp(
    lightTheme: lightTheme,
    darkTheme: darkTheme,
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({
    super.key,
    required this.lightTheme,
    required this.darkTheme,
  });

  final ThemeData lightTheme;
  final ThemeData darkTheme;

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<ThemeMode>(
      valueListenable: themeController,
      builder: (context, themeMode, _) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Gestion des albums',
          theme: lightTheme,
          darkTheme: darkTheme,
          themeMode: themeMode,
          home: const MyHomePage(),
          themeAnimationDuration: Duration.zero,
          onGenerateRoute: (settings) {
            if (settings.name == '') {
              return MaterialPageRoute(
                builder: (context) {
                  return const MyHomePage();
                },
              );
            }
            if (settings.name == '/infoAlbum') {
              return MaterialPageRoute(
                builder: (context) {
                  final args = settings.arguments as Map<String, String>;
                  return InfoAlbum(
                    nomAlbum: args['nomAlbum']!,
                    description: args['description']!,
                    nomGroupe: args['nomGroupe']!,
                    image: args['image']!,
                  );
                },
              );
            }
            return MaterialPageRoute(
              builder: (context) => const ErrorPage(),
            );
          },
        );
      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({
    super.key,
  });

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int pageIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MainAppBar(
        title: 'Gestion des albums',
        actions: [
          IconButton(
            icon: const Icon(Icons.lightbulb),
            onPressed: () {
              // Utiliser l'instance globale pour changer le thème
              themeController.toggleTheme();
            },
          ),
        ],
      ),
      body: [
        const HomeView(),
        const AlbumsView(),
        const SettingsView(),
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
      ),
      floatingActionButton: Visibility(
        visible: pageIndex == 0,
        child: FloatingActionButton(
          child: const Icon(Icons.add),
          onPressed: () {},
        ),
      ),
    );
  }
}
