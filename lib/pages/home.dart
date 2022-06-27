import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
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
              //Headline Text
              const Align(
                alignment: Alignment.topCenter,
                child: Padding(
                  padding: EdgeInsets.all(10.0),
                  child: Text(
                    "Welcome",
                    style: TextStyle(
                      fontSize: 28,
                      color: Color(0xFF26005f),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              const Align(
                alignment: Alignment.topCenter,
                child: Padding(
                  padding: EdgeInsets.all(40.0),
                  child: Text(
                    "Anthony,",
                    style: TextStyle(
                      fontSize: 28,
                      color: Color(0xFF26005f),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              //

              //Elevated Container
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 0, 0, 20),
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: Material(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    elevation: 6.0,
                    child: Container(
                      height: size.height - 200,
                      width: size.width - 50,
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(
                          Radius.circular(20),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
