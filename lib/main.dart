// ignore_for_file: avoid_print

import 'dart:async';
import 'package:aquaponics/pages/login.dart';
import 'package:aquaponics/pages/master.dart';
import 'package:aquaponics/services/application_bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';
import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  void signout() async {
    await FirebaseAuth.instance.signOut();
    // ignore: use_build_context_synchronously
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const Login(),
      ),
    );
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: ((context) => ApplicationBloc()),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primaryColor: Colors.purple,
          textTheme: GoogleFonts.openSansTextTheme().copyWith(
            headline1: GoogleFonts.candal(),
          ),
          colorScheme: ThemeData()
              .colorScheme
              .copyWith(primary: const Color(0xFF26005f)),
        ),
        title: 'Aquaponics',
        home: const MainPage(),
      ),
    );
  }
}

class MainPage extends StatelessWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Scaffold(
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
                onTap: () => FirebaseAuth.instance.signOut(),
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
        body: StreamBuilder<User?>(
          stream: FirebaseAuth.instance.authStateChanges(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return const Master();
            } else {
              return const Login();
            }
          },
        ),
      );
}
