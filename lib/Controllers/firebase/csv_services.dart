import 'dart:convert';
import 'dart:io';

import 'package:csv/csv.dart' as csv;
import 'package:diary_app/Models/data_model.dart';
import 'package:file_picker/src/file_picker.dart' as file_pick;
import 'package:googleapis/trafficdirector/v2.dart';
// import 'package:googleapis/vision/v3.dart';
import 'package:path_provider/path_provider.dart' as path_provide;

class CsvServices {
  static Future<void> generateCvs(String name) async {
    final directory = (await path_provide.getExternalStorageDirectory())!;

    final path = '${directory.path}/$name.csv';
    File(path).create();
  }

  static Future<void> writeCsv({required List<StoredData> data}) async {
    final directory = (await path_provide.getExternalStorageDirectory())!;
    final path = '${directory.path}/MyFile.csv';
    // ignore: avoid_print
    print(' Path :$path');

    for (int i = 0; i < data.length; i++) {
      File(path).writeAsStringSync(
          '${data[i].srNo},${data[i].date}, ${data[i].entry},\r\n',
          mode: FileMode.append);
    }
    // ignore: avoid_print
    print('File written Successfully');
  }

  List<List> get readCsv {
    try {
      return readCsvOO(
          '/storage/emulated/0/Android/data/com.example.diary_app/files/MyFile.csv');
    } catch (e) {
      // ignore: control_flow_in_finally
      return [];
    }
  }

  List<List> readCsvOO(String path) {
    csv.CsvToListConverter converter =
        const csv.CsvToListConverter(eol: '\r\n', fieldDelimiter: ',');
    try {
      List<List> generatedList =
          converter.convert(File(path).readAsStringSync());
      print(generatedList);
      return generatedList.toList();
    } catch (e) {
      writeCsv(data: []);
    }
    throw Exception('Error in reading file');
    // ignore: avoid_print
    // print('File read Successfully ${generatedList}');
  }

  static Future<String?> getFilePathOO(String name) async {
    final directory = (await path_provide.getExternalStorageDirectory())!;
    final path = '${directory.path}/$name.csv';
    return path;
  }

  static Future<File> getFile(String name) async {
    final directory = (await path_provide.getExternalStorageDirectory())!;
    final path = '${directory.path}/$name.csv';
    return File(path);
  }

  static Future<List<dynamic>> readCsvp(String name) async {
    final directory = (await path_provide.getExternalStorageDirectory())!;
    final path = '${directory.path}/$name.csv';
    final csvFile = File(path).openRead();
    return await csvFile
        .transform(utf8.decoder)
        .transform(const csv.CsvToListConverter())
        .toList();
  }

  // static Future<List<StoredData>> getData() async {}
}
