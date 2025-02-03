import 'package:flutter/material.dart';
import 'package:tp6/album.dart';

class AlbumsView extends StatefulWidget {
  const AlbumsView({super.key});

  @override
  State<AlbumsView> createState() => _AlbumsViewState();
}

class _AlbumsViewState extends State<AlbumsView> {
  List<Map<String, String>> list = [
    {
      "image": "images/Metallica.jpg",
      "description": "Une super description qui tue",
      "nomAlbum": "Metallica",
      "nomGroupe": "Metallica",
    },
    {
      "image": "images/Ride the lightning.jpg",
      "description": "Une super description qui tue",
      "nomAlbum": "Ride the lightning",
      "nomGroupe": "Metallica",
    },
    {
      "image": "images/Master of puppets.jpg",
      "description": "Une super description qui tue",
      "nomAlbum": "Master of puppets",
      "nomGroupe": "Metallica",
    },
    {
      "image": "images/Kill'em all.jpg",
      "description": "Une super description qui tue",
      "nomAlbum": "Kill'em",
      "nomGroupe": "Metallica",
    },
    {
      "image": "images/Hardwired.jpg",
      "description": "Une super description qui tue",
      "nomAlbum": "Hardwired",
      "nomGroupe": "Metallica",
    },
    {
      "image": "images/And justice for all.jpg",
      "description": "Une super description qui tue",
      "nomAlbum": "And justice for all",
      "nomGroupe": "Metallica",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.blue,
      alignment: Alignment.center,
      child: ListView(
        shrinkWrap: true,
        padding: const EdgeInsets.fromLTRB(2.0, 10.0, 2.0, 10.0),
        children: list
            .map(
              (e) => Album(
                nomAlbum: e['nomAlbum']!,
                description: e['description']!,
                nomGroupe: e['nomGroupe']!,
                image: e['image']!,
              ),
            )
            .toList(),
      ),
    );
  }
}
