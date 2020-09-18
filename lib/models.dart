// To parse this JSON data, do
//
//     final status = statusFromJson(jsonString);

import 'dart:convert';

class Status {
  Status({
    this.lastUpdate,
    this.services,
  });

  DateTime lastUpdate;
  List<Service> services;

  factory Status.fromRawJson(String str) => Status.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Status.fromJson(Map<String, dynamic> json) => Status(
    lastUpdate: DateTime.parse(json["last_update"]),
    services: List<Service>.from(json["services"].map((x) => Service.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "last_update": lastUpdate.toIso8601String(),
    "services": List<dynamic>.from(services.map((x) => x.toJson())),
  };
}

class Service {
  Service({
    this.name,
    this.health,
    this.result,
  });

  String name;
  String health;
  Result result;

  factory Service.fromRawJson(String str) => Service.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Service.fromJson(Map<String, dynamic> json) => Service(
    name: json["name"],
    health: json["health"],
    result: Result.fromJson(json["result"]),
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "health": health,
    "result": result.toJson(),
  };
}

class Result {
  Result({
    this.warnLevel,
    this.name,
    this.messages,
    this.consumers,
    this.status,
    this.nodeTotal,
    this.nodeData,
    this.shards,
    this.pri,
    this.relo,
    this.init,
    this.unassign,
    this.pendingTasks,
    this.maxTaskWaitTime,
    this.activeShardsPercent,
    this.attempts,
    this.successes,
    this.ratio,
  });

  String warnLevel;
  String name;
  int messages;
  int consumers;
  String status;
  int nodeTotal;
  int nodeData;
  int shards;
  int pri;
  int relo;
  int init;
  int unassign;
  int pendingTasks;
  String maxTaskWaitTime;
  int activeShardsPercent;
  int attempts;
  int successes;
  int ratio;

  factory Result.fromRawJson(String str) => Result.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Result.fromJson(Map<String, dynamic> json) => Result(
    warnLevel: json["WarnLevel"],
    name: json["Name"] == null ? null : json["Name"],
    messages: json["Messages"] == null ? null : json["Messages"],
    consumers: json["Consumers"] == null ? null : json["Consumers"],
    status: json["status"] == null ? null : json["status"],
    nodeTotal: json["nodeTotal"] == null ? null : json["nodeTotal"],
    nodeData: json["nodeData"] == null ? null : json["nodeData"],
    shards: json["shards"] == null ? null : json["shards"],
    pri: json["pri"] == null ? null : json["pri"],
    relo: json["relo"] == null ? null : json["relo"],
    init: json["init"] == null ? null : json["init"],
    unassign: json["unassign"] == null ? null : json["unassign"],
    pendingTasks: json["pending_tasks"] == null ? null : json["pending_tasks"],
    maxTaskWaitTime: json["max_task_wait_time"] == null ? null : json["max_task_wait_time"],
    activeShardsPercent: json["active_shards_percent"] == null ? null : json["active_shards_percent"],
    attempts: json["attempts"] == null ? null : json["attempts"],
    successes: json["successes"] == null ? null : json["successes"],
    ratio: json["ratio"] == null ? null : json["ratio"],
  );

  Map<String, dynamic> toJson() => {
    "WarnLevel": warnLevel,
    "Name": name == null ? null : name,
    "Messages": messages == null ? null : messages,
    "Consumers": consumers == null ? null : consumers,
    "status": status == null ? null : status,
    "nodeTotal": nodeTotal == null ? null : nodeTotal,
    "nodeData": nodeData == null ? null : nodeData,
    "shards": shards == null ? null : shards,
    "pri": pri == null ? null : pri,
    "relo": relo == null ? null : relo,
    "init": init == null ? null : init,
    "unassign": unassign == null ? null : unassign,
    "pending_tasks": pendingTasks == null ? null : pendingTasks,
    "max_task_wait_time": maxTaskWaitTime == null ? null : maxTaskWaitTime,
    "active_shards_percent": activeShardsPercent == null ? null : activeShardsPercent,
    "attempts": attempts == null ? null : attempts,
    "successes": successes == null ? null : successes,
    "ratio": ratio == null ? null : ratio,
  };
}
