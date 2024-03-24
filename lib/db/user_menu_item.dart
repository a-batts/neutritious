class UserMenuItem {
  final String? id;
  final String title;
  final String content;
  final String? imageURL;
  final List<String> likeUIDs;
  final bool favorited;
  final bool favoritible;

  const UserMenuItem({
    this.id,
    required this.title,
    required this.content,
    List<String>? likeUIDs,
    this.imageURL,
    this.favorited = false,
    this.favoritible = true,
  }) : likeUIDs = likeUIDs ?? const [];

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'content': content,
      'likeUIDs': likeUIDs,
      'imageURL': imageURL,
      'favorited': favorited,
    };
  }

  UserMenuItem.fromMap(Map<String, dynamic> map)
      : id = map['id'],
        title = map['title'],
        content = map['content'],
        imageURL = map['imageURL'],
        likeUIDs = map['likeUIDs']?.cast<String>() ?? [],
        favorited = map['favorited'] ?? false,
        favoritible = true;
}
