import 'dart:convert';
import 'dart:math';

import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;

import 'models.dart';

class NetworkHelper {
  NetworkHelper(this.url);

  final String url;

  Future<Status> readStatuses() async {
    print("Reading Statuses from file");
      try {
        var randomInfos = Random().nextInt(3);
        var fileData = await rootBundle.loadString("assets/mockData$randomInfos.json");

        // Read the file.
        print(fileData);
        return Status.fromJson(jsonDecode(fileData));
      }catch(e){
        return Status();
      }
  }

  Future getData() async {
    http.Response response = await http.get(url);
    if (response.statusCode >= 200 && response.statusCode < 300) {
      String data = response.body;
      return jsonDecode(data);
    } else {
      print(response.statusCode);
    }
  }
}