import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:tp6/carousel.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  List<Container> list = [
    Container(
      width: double.infinity,
      child: Image.asset("images/Metallica.jpg"),
    ),
    Container(
      width: double.infinity,
      child: Image.asset("images/Kill'em all.jpg"),
    ),
    Container(
      width: double.infinity,
      child: Image.asset("images/Hardwired.jpg"),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Card(
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 10),
            child: Row(
              children: [
                Image.asset('images/imgAccueil/vinyltransp.webp'),
                const SizedBox(
                  width: 15,
                ),
                const Expanded(
                  child: Text(
                    "Bienvenue sur l'application de gestion d'album",
                    style: TextStyle(
                      fontSize: 22,
                      height: 1.2,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
        const SizedBox(height: 10,),
        Carousel(carouselItems: list),
        Card(
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            child: const Column(
              children: [
                Row(
                  children: [
                    Text(
                      "News",
                    )
                  ],
                ),
                Row(
                  children: [
                    Text(
                      "Dernières actualités",
                      style: TextStyle(color: Colors.grey),
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
        Card(
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            child: const Column(
              children: [
                Row(
                  children: [
                    Text(
                      "Version 1 en cours de développement",
                    )
                  ],
                ),
                Row(
                  children: [
                    Text("Wait and see", style: TextStyle(color: Colors.grey))
                  ],
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
