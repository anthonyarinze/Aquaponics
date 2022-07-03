// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:aquaponics/pages/reset_password.dart';
import 'package:flutter/material.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: [
              const Align(
                alignment: Alignment.topCenter,
                child: Padding(
                  padding: EdgeInsets.all(10.0),
                  child: Text(
                    "Welcome to Aquaponics",
                    overflow: TextOverflow.ellipsis,
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
                  padding: EdgeInsets.all(5.0),
                  child: Text(
                    "Let's help you get started",
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontSize: 19,
                      color: Color(0xFF26005f),
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 40),
              const Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: EdgeInsets.fromLTRB(32, 60, 0, 0),
                  child: Text(
                    "Sign up",
                    style: TextStyle(
                      fontSize: 30,
                      color: Color(0xFF26005f),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              const BuildTextField(
                hintText: "Enter your full name",
                labelText: "Name",
                icon: Icons.person_rounded,
                obscureText: false,
              ),
              const BuildTextField(
                hintText: "Enter your email address",
                labelText: "Email",
                icon: Icons.email_rounded,
                obscureText: false,
              ),
              const BuildTextField(
                hintText: "Create a password",
                labelText: "Password",
                icon: Icons.lock_rounded,
                obscureText: true,
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
                child: const Align(
                  alignment: Alignment.centerRight,
                  child: Padding(
                    padding: EdgeInsets.fromLTRB(0, 0, 20, 0),
                    child: Text(
                      "Forgot Password?",
                      style: TextStyle(
                        color: Color(0xFF26005f),
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(25, 10, 25, 0),
                child: SizedBox(
                  width: MediaQuery.of(context).size.width,
                  child: TextButton(
                    onPressed: () {},
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(
                        const Color(0xFF26005f),
                      ),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(18.0),
                        ),
                      ),
                    ),
                    child: const Text(
                      "Continue",
                      style: TextStyle(
                        fontSize: 30,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
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

class BuildTextField extends StatelessWidget {
  final String hintText;
  final IconData icon;
  final String labelText;
  final bool obscureText;

  const BuildTextField({
    Key? key,
    required this.hintText,
    required this.icon,
    required this.labelText,
    required this.obscureText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SizedBox(
        width: MediaQuery.of(context).size.width * 0.8,
        child: TextField(
          autocorrect: false,
          obscureText: obscureText,
          decoration: InputDecoration(
            labelText: labelText,
            labelStyle: const TextStyle(
              fontSize: 20,
              color: Color(0xFF26005f),
              fontWeight: FontWeight.w600,
            ),
            hintText: hintText,
            prefixIcon: Icon(
              icon,
              color: const Color(0xFF26005f),
              size: 40,
            ),
          ),
        ),
      ),
    );
  }
}
