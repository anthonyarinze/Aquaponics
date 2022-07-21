import 'package:flutter/material.dart';

class Model extends StatefulWidget {
  const Model({Key? key}) : super(key: key);

  @override
  State<Model> createState() => _ModelState();
}

class _ModelState extends State<Model> {
  @override
  Widget build(BuildContext context) {
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
            children: const [],
          ),
        ),
      ),
    );
  }
}
