class AlarmsModel {
  final int id;
  final String userid;
  final String day;
  final String time;
  final int status;

  AlarmsModel({
    required this.id,
    required this.userid,
    required this.day,
    required this.time,
    required this.status,
  });

  AlarmsModel.fromMap(Map<String, dynamic> item)
      : id = item["id"],
        userid = item["userid"],
        day = item["day"],
        time = item["time"],
        status = item["status"];

  Map<String, Object> toMap() {
    return {
      "id": id,
      "userid": userid,
      "day": day,
      "time": time,
      "status": status,
    };
  }
}
