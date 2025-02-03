import 'package:flutter/material.dart';

class Album extends StatelessWidget {
  Album({
    Key? key,
    required this.nomAlbum,
    required this.description,
    required this.nomGroupe,
    required this.image,
  }) : super(key: key);
  final String nomAlbum;
  final String description;
  final String nomGroupe;
  final String image;

  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(2),
      height: 120,
      child: Card(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Image.asset(image),
            Expanded(
              child: Container(
                padding: const EdgeInsets.all(5),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Text(
                      nomAlbum!,
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Text(description),
                    Text("Valeur: $nomGroupe"),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
