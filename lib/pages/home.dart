import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String documentId = FirebaseAuth.instance.currentUser!.uid;
  CollectionReference student = FirebaseFirestore.instance.collection('users');

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
              Align(
                alignment: Alignment.topCenter,
                child: Padding(
                  padding: const EdgeInsets.all(40.0),
                  child: GetUsername(student: student, documentId: documentId),
                ),
              ),

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

class GetUsername extends StatelessWidget {
  const GetUsername({
    Key? key,
    required this.student,
    required this.documentId,
  }) : super(key: key);

  final CollectionReference<Object?> student;
  final String documentId;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<DocumentSnapshot>(
      //Fetching data from the documentId specified of the student
      future: student.doc(documentId).get(),
      builder:
          (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot) {
        //Error Handling conditions
        if (snapshot.hasError) {
          return const Text("Something went wrong");
        }

        if (snapshot.hasData && !snapshot.data!.exists) {
          return const Text("Document does not exist");
        }

        //Data is output to the user
        if (snapshot.connectionState == ConnectionState.done) {
          Map<String, dynamic> data =
              snapshot.data!.data() as Map<String, dynamic>;
          return Text(
            data['username'] + ",",
            style: const TextStyle(
              color: Color(0xFF26005f),
              fontSize: 28,
              fontWeight: FontWeight.bold,
            ),
          );
        }

        return const Text("loading");
      },
    );
  }
}
