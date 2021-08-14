import 'package:diary_app/Models/data_model.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

// import 'package:diary_app/Controllers/firebase/firebase_services.dart';
import 'package:diary_app/Controllers/firebase/csv_services.dart'
    as csv_services;

class HomeScrene extends StatefulWidget {
  const HomeScrene({Key? key}) : super(key: key);

  @override
  _HomeScreneState createState() => _HomeScreneState();
}

class _HomeScreneState extends State<HomeScrene> {
  // ignore: unused_field
  final User? _user = FirebaseAuth.instance.currentUser;
  List<StoredData> data = [
    StoredData(
      srNo: 1,
      date: DateTime.now(),
      entry: 'Text Data 1',
    ),
    StoredData(
      srNo: 2,
      date: DateTime.now(),
      entry: 'Text Data 2',
    ),
    StoredData(
      srNo: 3,
      date: DateTime.now(),
      entry: 'Text Data 3',
    ),
  ];

  final textController = TextEditingController();

  void submitText() {
    setState(() {
      data.add(StoredData(
          date: DateTime.now(),
          entry: textController.text.trim(),
          srNo: csv_services.CsvServices().readCsv.length + 1));
      csv_services.CsvServices.writeCsv(data: data);
      data = [];
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
            CircleAvatar(
              radius: 20,
              backgroundImage: NetworkImage(
                  _user != null ? _user!.photoURL! : '_user.photoURL'),
            ),
            IconButton(
              icon: const Icon(Icons.file_download),
              // onPressed: () => csv_services.CsvServices().readCsv,
              onPressed: () => csv_services.CsvServices.writeCsv(
                data: data,
              ),
              // onPressed: () => csv_services.CsvServices.generateCvs('MyFile'),
              // onPressed: () async => FirebaseServices.upload(),
              // onPressed: () =>print(csv_services.CsvServices.readCsv('MyFile')),
            )
          ],
        ),
      ),
      body: ListView.builder(
        itemCount: csv_services.CsvServices().readCsv.length,
        itemBuilder: (context, index) {
          return Card(
            margin: const EdgeInsets.all(5),
            child: Container(
              padding: const EdgeInsets.all(10),
              height: 60,
              child: Text(
                csv_services.CsvServices().readCsv[index][0].toString(),
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
