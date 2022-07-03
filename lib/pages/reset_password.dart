import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'login.dart';

class ResetPassword extends StatefulWidget {
  const ResetPassword({Key? key}) : super(key: key);

  @override
  ResetPasswordState createState() => ResetPasswordState();
}

class ResetPasswordState extends State<ResetPassword> {
  late String email;
  final _auth = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Row(
              children: [
                IconButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const Login(),
                      ),
                    );
                  },
                  icon: const Icon(
                    Icons.arrow_back,
                    color: Colors.black,
                  ),
                ),
                Text(
                  "Back",
                  style: GoogleFonts.shipporiAntique(
                      color: Colors.black, fontSize: 20),
                ),
              ],
            ),
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 30, 148, 0),
                  child: Text(
                    "Reset password",
                    style: GoogleFonts.shipporiAntique(
                        color: Colors.black,
                        fontSize: 26,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(20, 12, 20, 0),
                  child: Text(
                    "Enter the email associated with your account "
                    "and we'll send an email with instructions to reset your password",
                    style: GoogleFonts.shipporiAntique(
                        color: Colors.black, fontSize: 20),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 40, 210, 0),
                  child: Text(
                    "Email address",
                    style: GoogleFonts.shipporiAntique(
                        color: Colors.black, fontSize: 20),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    width: 350,
                    decoration: BoxDecoration(
                      border: Border.all(
                        width: 2,
                        color: Colors.grey.withOpacity(0.4),
                      ),
                      borderRadius: const BorderRadius.all(
                        Radius.circular(10),
                      ),
                    ),
                    child: TextField(
                      onChanged: (value) {
                        email = value;
                      },
                      decoration: const InputDecoration(
                        disabledBorder: InputBorder.none,
                        enabledBorder: InputBorder.none,
                        focusedBorder: InputBorder.none,
                        hintText: "Enter your email",
                        contentPadding: EdgeInsets.fromLTRB(10, 0, 20, 0),
                      ),
                    ),
                  ),
                ),
                TextButton(
                  onPressed: () {
                    _auth.sendPasswordResetEmail(email: email);
                    Navigator.pop(context);
                  },
                  child: Container(
                    height: 70,
                    width: 350,
                    decoration: BoxDecoration(
                      color: Colors.yellow[700],
                      borderRadius: const BorderRadius.all(
                        Radius.circular(10),
                      ),
                    ),
                    child: Center(
                      child: Text(
                        "Reset password",
                        style: GoogleFonts.shipporiAntique(
                            color: Colors.white, fontSize: 20),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
