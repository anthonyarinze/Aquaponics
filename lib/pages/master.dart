import 'package:aquaponics/pages/home.dart';
import 'package:aquaponics/pages/model.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';

import 'location.dart';

class Master extends StatefulWidget {
  const Master({Key? key}) : super(key: key);

  @override
  State<Master> createState() => _MasterState();
}

class _MasterState extends State<Master> {
  int index = 1;
  @override
  Widget build(BuildContext context) {
    final screens = [
      const Location(),
      const Home(),
      const Model(),
    ];

    //List of icons in the bottom nav bar.
    final items = <Widget>[
      const Icon(Icons.location_on_rounded, size: 30, color: Color(0xFF26005f)),
      const Icon(Icons.home_rounded, size: 30, color: Color(0xFF26005f)),
      const Icon(Icons.bar_chart_rounded, size: 30, color: Color(0xFF26005f)),
    ];

    return Scaffold(
      resizeToAvoidBottomInset: false,
      bottomNavigationBar: CurvedNavigationBar(
        items: items,
        index: index,
        height: 60,
        onTap: (index) => setState(() => this.index = index),
        backgroundColor: const Color(0xFF26005f),
        animationDuration: const Duration(milliseconds: 300),
      ),
      body: screens[index],
    );
  }
}
