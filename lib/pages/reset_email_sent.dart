import 'package:aquaponics/pages/reset_password.dart';
import 'package:flutter/material.dart';

import 'login.dart';

class ResetComplete extends StatefulWidget {
  const ResetComplete({Key? key}) : super(key: key);

  @override
  _ResetCompleteState createState() => _ResetCompleteState();
}

class _ResetCompleteState extends State<ResetComplete> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const SizedBox(
            height: 120,
          ),
          Center(
            child: Container(
              height: 200,
              width: 250,
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.all(
                  Radius.circular(20),
                ),
                color: const Color(0xFF26005f).withOpacity(0.2),
              ),
              child: const Icon(
                Icons.mark_email_read,
                color: Color(0xFF26005f),
                size: 150,
              ),
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          const Center(
            child: Text(
              "Check your mail",
              style: TextStyle(color: Colors.black, fontSize: 30),
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          const Text(
            "We've sent password recovery",
            style: TextStyle(color: Colors.black, fontSize: 20),
          ),
          const Text(
            " instructions to your email.",
            style: TextStyle(color: Colors.black, fontSize: 20),
          ),
          const SizedBox(
            height: 30,
          ),
          TextButton(
            onPressed: () async {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const Login(),
                ),
              );
            },
            child: Container(
              height: 70,
              width: 350,
              decoration: const BoxDecoration(
                color: Color(0xFF26005f),
                borderRadius: BorderRadius.all(
                  Radius.circular(10),
                ),
              ),
              child: const Center(
                  child: Text(
                "Log In",
                style: TextStyle(color: Colors.white, fontSize: 20),
              )),
            ),
          ),
          const Text(
            "Didn't receive a email? Check your spam filter or",
            style: TextStyle(fontSize: 17),
          ),
          TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const ResetPassword(),
                  ),
                );
              },
              child: const Text(
                "try another email",
                style: TextStyle(color: Color(0xFF26005f), fontSize: 17),
              ))
        ],
      ),
    );
  }
}
