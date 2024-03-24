class Profile {
  final String id;
  final String name;
  final String username;

  Profile({
    required this.id,
    required this.name,
    required this.username,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'username': username,
    };
  }

  Profile.fromMap(Map<String, dynamic> map)
    : id = map['id'],
      name = map['name'],
      username = map['username'];
}