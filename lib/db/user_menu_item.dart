class UserMenuItem {
  final String id;
  final String title;
  final String content;
  final List<String> likeUIDs;

  UserMenuItem({
    required this.id,
    required this.title,
    required this.content,
    required this.likeUIDs,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'content': content,
      'likeUIDs': likeUIDs,
    };
  }

  UserMenuItem.fromMap(Map<String, dynamic> map)
    : id = map['id'],
      title = map['title'],
      content = map['content'],
      likeUIDs = map['likeUIDs'];
}