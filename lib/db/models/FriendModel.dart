class FriendModel {
  final String id;
  final String friendid;

  FriendModel({required this.id, required this.friendid});

  FriendModel.fromMap(Map<String, dynamic> item)
      : id = item["id"],
        friendid = item["friendid"];

  Map<String, Object> toMap() {
    return {
      "id": id,
      "friendid": friendid,
    };
  }
}
