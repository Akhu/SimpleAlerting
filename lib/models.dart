class Status {
  Status({
    this.lastUpdate,
    this.services,
  });

  DateTime lastUpdate;
  List<Service> services;
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
}