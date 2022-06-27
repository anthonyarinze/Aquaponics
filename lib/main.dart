import 'package:aquaponics/pages/home.dart';
import 'package:aquaponics/pages/location.dart';
import 'package:aquaponics/pages/model.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int index = 1;

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    //List of screens
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

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Colors.purple,
        textTheme: GoogleFonts.openSansTextTheme().copyWith(
          headline1: GoogleFonts.candal(),
        ),
      ),
      title: 'Aquaponics',
      home: SafeArea(
        top: false,
        child: Scaffold(
          drawer: Drawer(
            elevation: 3,
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(20),
                bottomRight: Radius.circular(20),
              ),
            ),

            //ListView used to ensure user can scroll if there isn't enough vertical real estate.
            child: ListView(
              //Important: Remove any padding from the ListView.
              padding: EdgeInsets.zero,
              children: [
                const SizedBox(height: 25),
                DrawerHeader(
                  decoration: const BoxDecoration(color: Colors.white),
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey, width: 1),
                      color: Colors.white,
                      borderRadius: const BorderRadius.all(Radius.circular(40)),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(13, 20, 0, 20),
                      child: Row(
                        children: [
                          const CircleAvatar(
                            foregroundColor: Colors.white,
                            backgroundColor: Color(0xFF26005f),
                            radius: 40,
                            child: Icon(
                              Icons.person,
                              size: 45,
                            ),
                          ),
                          Flexible(
                            child: Column(
                              children: [
                                const Padding(
                                  padding: EdgeInsets.fromLTRB(0, 20, 80, 0),
                                  child: Text(
                                    "John Doe",
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    "john_doe@gmail.com",
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyle(
                                      color: Colors.grey.shade700,
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                ListTile(
                  leading: Icon(
                    Icons.info,
                    color: Colors.grey.shade700,
                  ),
                  title: const Text(
                    "About this project",
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 17,
                    ),
                  ),
                  trailing:
                      const Icon(Icons.arrow_forward_ios, color: Colors.grey),
                ),
                ListTile(
                  leading: Icon(
                    Icons.lock,
                    color: Colors.grey.shade700,
                  ),
                  title: const Text(
                    "Change password",
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 17,
                    ),
                  ),
                  trailing:
                      const Icon(Icons.arrow_forward_ios, color: Colors.grey),
                ),
                ListTile(
                  leading: Icon(
                    Icons.logout_rounded,
                    color: Colors.grey.shade700,
                  ),
                  title: const Text(
                    "Sign Out",
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 17,
                    ),
                  ),
                ),
              ],
            ),
          ),
          bottomNavigationBar: CurvedNavigationBar(
            items: items,
            index: index,
            height: 60,
            onTap: (index) => setState(() => this.index = index),
            backgroundColor: const Color(0xFF26005f),
            animationDuration: const Duration(milliseconds: 300),
          ),
          body: screens[index],
        ),
      ),
    );
  }
}