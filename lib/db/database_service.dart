import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:neutritious/db/log.dart';
import 'package:neutritious/db/profile.dart';
import 'package:neutritious/db/user_menu_item.dart';

class DatabaseService {
  final FirebaseFirestore _db = FirebaseFirestore.instance;

  Future<Profile?> fetchProfile(String id) async {
    var user = (await _db.collection('users').doc(id).get()).data();
    if (user == null) {
      return null;
    }
    return Profile.fromMap(user);
  }

  Future<UserMenuItem?> fetchUserMenuItem(String id) async {
    var item = (await _db.collection('menuitems').doc(id).get()).data();
    if (item == null) {
      return null;
    }
    return UserMenuItem.fromMap(item);
  }

  Future<void> createUserMenuItem(UserMenuItem item) async {
    await _db.collection('menuitems').doc().set(item.toMap());
  }

  // Fetch function for Log
  Future<Log?> fetchLog(String id) async {
    var logData = (await _db.collection('logs').doc(id).get()).data();
    if (logData == null) {
      return null;
    }
    return Log.fromMap(logData);
  }

  // Create function for Log
  Future<void> createLog(Log log) async {
    await _db.collection('logs').doc().set(log.toMap());
  }
}