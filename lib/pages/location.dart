import 'package:flutter/material.dart';
import 'package:jiffy/jiffy.dart';

class Location extends StatefulWidget {
  const Location({Key? key}) : super(key: key);

  @override
  State<Location> createState() => _LocationState();
}

class _LocationState extends State<Location> {
  DateTime currentTime = DateTime.now();
  @override
  Widget build(BuildContext context) {
    String result = Jiffy(currentTime).format('MMMM dd yyyy');
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Container(
          height: double.infinity,
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [Color(0xFFdfdfdf), Color(0xFF26005f)],
              stops: [0.5, 0.5],
            ),
          ),
          child: Stack(
            children: [
              Align(
                alignment: Alignment.topCenter,
                child: Column(
                  children: [
                    const Text(
                      "Lagos",
                      style: TextStyle(
                        fontSize: 30,
                        color: Color(0xFF26005f),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      result,
                      style: const TextStyle(
                        fontSize: 16,
                        color: Color(0xFF26005f),
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
