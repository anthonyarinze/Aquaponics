import 'package:flutter/material.dart';

class Welcome extends StatelessWidget {
  const Welcome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color(0xFF26005f),
        body: Column(
          children: [
            ClipPath(
              clipper: BezierClipper(),
              child: Container(
                height: size.height - 300,
                width: size.width,
                color: Colors.white,
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(10, 100, 10, 0),
                  child: Column(
                    children: const [
                      Text(
                        "Welcome to Aquaponics",
                        style: TextStyle(
                          color: Color(0xFF26005f),
                          fontSize: 30,
                        ),
                      ),
                      SizedBox(height: 10),
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(height: 30),
            const Text(
              "Your go-to app",
              style: TextStyle(
                color: Colors.white,
                fontSize: 25,
              ),
            ),
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                "to keep you up to speed",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 25,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class BezierClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    path.lineTo(0, size.height * 0.85); //vertical line
    path.cubicTo(
      size.width / 3,
      size.height,
      2 * size.width / 3,
      size.width * 0.7,
      size.width,
      size.height * 0.85,
    ); //cubic curve
    path.lineTo(size.width, 0); //vertical line
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => true;
}
