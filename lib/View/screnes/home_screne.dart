import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class HomeScrene extends StatefulWidget {
  const HomeScrene({Key? key}) : super(key: key);

  @override
  _HomeScreneState createState() => _HomeScreneState();
}

class _HomeScreneState extends State<HomeScrene> {
  // ignore: unused_field
  final User? _user = FirebaseAuth.instance.currentUser;
  List<String> data = ['text1 ', 'text2'];
  final textController = TextEditingController();

  void submitText() {
    setState(() {
      data.add(textController.text);
    });

    Navigator.pop(context);
    textController.text = '';
  }

  void addingANewNote() {
    showModalBottomSheet(
      context: context,
      builder: (context) => Container(
        padding: const EdgeInsets.all(20),
        child: Column(
          // ignore: prefer_const_literals_to_create_immutables
          children: [
            TextField(
              controller: textController,
              decoration: const InputDecoration(
                hintText: 'Text',
              ),
              minLines: 10,
              maxLines: 20,
            ),
            ElevatedButton(
              onPressed: submitText,
              child: const Icon(Icons.subdirectory_arrow_left),
            )
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          // ignore: prefer_const_literals_to_create_immutables
          children: [
            const Text('My App Bar'),
            const CircleAvatar(
              radius: 20,
              backgroundImage: NetworkImage(
                '_user.photoURL',
              ),
            )
          ],
        ),
      ),
      body: ListView.builder(
        itemCount: data.length,
        itemBuilder: (context, index) {
          return Card(
            margin: const EdgeInsets.all(5),
            child: Container(
              padding: const EdgeInsets.all(10),
              height: 60,
              child: Text(
                data[index],
                style: const TextStyle(fontSize: 20),
              ),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: addingANewNote,
        child: const Icon(Icons.add),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
