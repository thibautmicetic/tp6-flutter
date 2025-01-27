import 'package:flutter/material.dart';

class SettingsView extends StatefulWidget {
  const SettingsView({super.key});

  @override
  State<SettingsView> createState() => _SettingsViewState();
}

class _SettingsViewState extends State<SettingsView> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Card(
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            child: const Column(
              children: [
                Row(
                  children: [
                    Text(
                      "Configurer les paramètres de l'application",
                    )
                  ],
                ),
                Row(
                  children: [
                    Text(
                      "Work in progress",
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
                      "Param2",
                    )
                  ],
                ),
                Row(
                  children: [
                    Text(
                      "Work in progress",
                      style: TextStyle(color: Colors.grey),
                    )
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
