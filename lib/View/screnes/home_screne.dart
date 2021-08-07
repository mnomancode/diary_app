import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class HomeScrene extends StatefulWidget {
  const HomeScrene({Key? key}) : super(key: key);

  @override
  _HomeScreneState createState() => _HomeScreneState();
}

class _HomeScreneState extends State<HomeScrene> {
  final User? _user = FirebaseAuth.instance.currentUser;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text('My App Bar'),
            CircleAvatar(
              radius: 20,
              backgroundImage: NetworkImage(
                _user!.photoURL!,
              ),
            )
          ],
        ),
      ),
    );
  }
}
