class Log {
  final String id;
  final DateTime timestamp;
  final String menuItemId;
  final String menuItemName;

  Log({
    required this.id,
    required this.timestamp,
    required this.menuItemId,
    required this.menuItemName,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'timestamp': timestamp,
      'menuItemId': menuItemId,
      'menuItemName': menuItemName,
    };
  }

  Log.fromMap(Map<String, dynamic> map)
    : id = map['id'],
      timestamp = map['timestamp'],
      menuItemId = map['menuItemId'],
      menuItemName = map['menuItemName'];
}