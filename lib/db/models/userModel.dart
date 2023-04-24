class UserModel {
  final int id;
  final String name;
  final String username;
  final String password;
  final String description;

  UserModel({
    required this.id,
    required this.name,
    required this.username,
    required this.password,
    required this.description,
  });

  UserModel.fromMap(Map<String, dynamic> item)
      : id = item["id"],
        name = item["name"],
        username = item["username"],
        password = item["password"],
        description = item["description"];

  Map<String, Object> toMap() {
    return {
      "id": id,
      "name": name,
      "username": username,
      "password": password,
      "description": description,
    };
  }
}
