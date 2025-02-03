import 'package:flutter/material.dart';

class InfoAlbum extends StatefulWidget {
  const InfoAlbum({
    super.key,
    required this.nomAlbum,
    required this.description,
    required this.image,
    required this.nomGroupe,
  });

  final String nomAlbum;
  final String description;
  final String image;
  final String nomGroupe;

  @override
  State<InfoAlbum> createState() => _InfoAlbumState();
}

class _InfoAlbumState extends State<InfoAlbum> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Informations sur l'album"),
      ),
      body: ListView(
        children: [
          const SizedBox(
            height: 40,
          ),
          CircleAvatar(radius: 20,child: Image.asset(widget.image,),),
          const SizedBox(
            height: 40,
          ),
          Text(
            widget.nomAlbum,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontWeight: FontWeight.w500, fontSize: 24,),
          ),
          const SizedBox(
            height: 40,
          ),
          Container(
            decoration: const BoxDecoration(color: Colors.green),
            child: Column(
              children: [
                const SizedBox(
                  height: 5,
                ),
                Text(
                  "Groupe: ${widget.nomGroupe}",
                  style: const TextStyle(
                      fontWeight: FontWeight.w500, fontSize: 18,),
                ),
                const SizedBox(
                  height: 20,
                ),
                const Text(
                  "Informations supplémentaires: ",
                  style: TextStyle(fontWeight: FontWeight.w500, fontSize: 14,),
                ),
                const SizedBox(
                  height: 20,
                ),
                Text(
                  widget.description,
                  style: const TextStyle(
                      fontWeight: FontWeight.w500, fontSize: 14,),
                ),
                const SizedBox(
                  height: 5,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
