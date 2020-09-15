import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'models.dart';
import 'network_helper.dart';

class StatusPage extends StatefulWidget {
  @override
  _StatusPageState createState() => _StatusPageState();
}

class _StatusPageState extends State<StatusPage> {

  Future<Status> status;
  @override
  void initState(){
    super.initState();
    refreshData();
  }

  void refreshData() async {

    status = await StatusModel()
        .getDataFromNetwork();
    //https://flutter.dev/docs/cookbook/networking/fetch-data
  }

  Widget _placeholder(AsyncSnapshot<Status> snapshot) {

    return Text(snapshot.hasData.toString());
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: status,
      builder: (context, snapshot) {
        if(snapshot.hasData){
          return new Scaffold(
            appBar: AppBar(title: Text("Loaded"),),
            body: Center(
              child: Text(snapshot.data),
            ),
          );
        }else {
          return Scaffold(
            appBar: AppBar(title: Text("Loading"),),
            body: _placeholder(snapshot),
          );
        }
      },
    );
  }
}

class StatusModel {

  static var url = "http://10.0.1.93:8080/api";

  Future<dynamic> getDataFromNetwork() async {
    NetworkHelper networkHelper = NetworkHelper("$url");

    var statusData = await networkHelper.getData();
    return statusData;
  }
}

