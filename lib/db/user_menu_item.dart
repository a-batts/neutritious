class UserMenuItem {
  final String? id;
  final String title;
  final String content;
  final String? imageURL;
  final List<String> likeUIDs;

  const UserMenuItem({
    this.id,
    required this.title,
    required this.content,
    List<String>? likeUIDs,
    this.imageURL,
  }) : likeUIDs = likeUIDs ?? const [];

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'content': content,
      'likeUIDs': likeUIDs,
      'imageURL': imageURL,
    };
  }

  UserMenuItem.fromMap(Map<String, dynamic> map)
    : id = map['id'],
      title = map['title'],
      content = map['content'],
      imageURL = map['imageURL'],
      likeUIDs = map['likeUIDs'];
}