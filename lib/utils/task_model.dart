

class Task {
  int? id;
  String? description;
  String? time;
  String? day;

  Task({ this.description, this.time,
    this.day
  });

  Task.withId({
    this.id,
    this.description,
    this.time
    ,this.day
  });

  Map<String, dynamic> toMap() {
    final map = Map<String, dynamic>();
    if(id != null){
      map["id"] = id;

    }
    map["description"] = description;
    map["time"] = time;
    map["day"]= day;
    return map;
  }

  factory Task.fromMap(Map<String, dynamic> map){
    return Task.withId(
      id: map["id"],
      description: map["description"],
      time: map["time"],
      day: map["day"]

    );
  }
}