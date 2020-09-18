import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
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
    setState(() {
        status = NetworkHelper("test").readStatuses();
    });

    //status = await StatusModel().getDataFromNetwork();
    //https://flutter.dev/docs/cookbook/networking/fetch-data
  }

  Widget _placeholder(AsyncSnapshot<Status> snapshot) {
    return Center(child: Row(
      children: <Widget>[
        Text(snapshot.hasData.toString()),
        SpinKitFadingFour(
          color: Colors.black,
        )
      ],
    ));
  }

  Widget indicatorFromText(String statusText){
    var color = Colors.grey;
    if(statusText == "green") {
        color = Colors.green;
    }else if (statusText == "red") {
      color = Colors.red;
    }else if (statusText == "yellow") {
      color = Colors.yellow;
    }

    return Container(
      height: 15,
      width: 15,
      decoration: BoxDecoration(
        color: color,
        shape: BoxShape.circle,
        boxShadow: [BoxShadow(
            color: color.withOpacity(0.7),
            blurRadius: 7,
            offset: Offset(0, 4)
        )]
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<Status>(
      future: status,
      builder: (context, snapshot) {
        if(snapshot.hasData){
          return new Scaffold(
            appBar: AppBar(title: Text("Status at ${snapshot.data.lastUpdate}"),),
            floatingActionButton: FloatingActionButton(
              onPressed: refreshData,
              tooltip: "Fetching data from server",
              child: Icon(
                Icons.refresh
              ),
            ),
            body: Column(
              mainAxisAlignment: MainAxisAlignment.start,
             crossAxisAlignment: CrossAxisAlignment.start,
             children: <Widget>[
               Padding(
                 padding: const EdgeInsets.all(8.0),
                 child: Text("Error " +  snapshot.error.toString(), textAlign: TextAlign.left,),
               ),
               Expanded(
                 child: ListView(
                   physics: BouncingScrollPhysics(),
                   children: snapshot.data.services.map((e) => ListTile(
                    title: Text(e.name),
                     subtitle: Text(e.result.name != null ? e.result.name : ""),
                     trailing: indicatorFromText(e.health),
                     onTap: () { showDialog(
                         context: context,
                         builder: (BuildContext context) {
                           return SimpleDialog(
                             title: const Text('Service details'),
                             children: <Widget>[

                             ],
                           );
                         }
                      );}
                   ),
                   ).toList()
                 ),
               )
             ],
            ),
          );
        }else {
          return Scaffold(
            appBar: AppBar(title: Text("Refreshing..."),),
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

