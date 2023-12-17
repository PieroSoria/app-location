import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';

import 'chats.dart';
import 'home.dart';
import 'perfil.dart';

class Index extends StatefulWidget {
  final int dashindex;
  final Widget selectcurrentwidget;
  const Index(
      {super.key, required this.selectcurrentwidget, required this.dashindex});

  @override
  State<Index> createState() => _IndexState();
}

class _IndexState extends State<Index> {
  late Widget _currentWidget;

  String? widgetapp;
  @override
  void initState() {
    super.initState();

    _currentWidget = widget.selectcurrentwidget;
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: const Color.fromARGB(255, 10, 7, 49),
      extendBody: true,
      body: Container(
        decoration: const BoxDecoration(
          color: Color.fromARGB(255, 167, 166, 166),
        ),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(0, 0, 0, 90),
          child: _currentWidget,
        ),
      ),
      bottomNavigationBar: CurvedNavigationBar(
        backgroundColor: const Color.fromARGB(255, 167, 166, 166),
        color: Colors.grey.shade200,
        animationDuration: const Duration(milliseconds: 200),
        index: widget.dashindex,
        onTap: (index) {
          setState(() {
            if (index == 0) {
              _currentWidget = const Home();
            } else if (index == 1) {
              _currentWidget = const ChatMessage();
            } else if (index == 2) {
              _currentWidget = const Perfil();
            }
          });
        },
        items: const [
          Icon(Icons.dashboard),
          Icon(Icons.emoji_transportation),
          Icon(Icons.person),
        ],
      ),
    );
  }
}
