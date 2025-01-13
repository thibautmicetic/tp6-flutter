import 'package:flutter/material.dart';

class MainAppBar extends StatefulWidget implements PreferredSizeWidget {
  const MainAppBar(
      {super.key,
      required this.title,
      required this.actions,
      this.bgColor = Colors.green});

  @override
  State<MainAppBar> createState() => _MainAppBarState();

  final String title;
  final List<Widget> actions;
  final Color bgColor;

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

class _MainAppBarState extends State<MainAppBar> {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: widget.bgColor,
      title: Text(widget.title),
      actions: <Widget>[
        IconButton(
          onPressed: () {},
          icon: const Icon(Icons.search),
        ),
        ...widget.actions,
      ],
    );
  }
}
