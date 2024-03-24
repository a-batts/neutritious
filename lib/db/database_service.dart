import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:neutritious/db/log.dart';
import 'package:neutritious/db/profile.dart';
import 'package:neutritious/db/user_menu_item.dart';
import 'package:neutritious/enums/menu_category.dart';

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

  Future<List<UserMenuItem>> fetchUserMenuItems(MenuCategory category) async {
    try {
    var item = (await _db.collection(category.collection).get());
    return item.docs.map((e) => UserMenuItem.fromMap({...e.data(), 'id': e.id})).toList();
    } catch(e, trace) {
      log(e.toString());
      log(trace.toString());
      return [];
    }
  }

  Future<void> createUserMenuItem(UserMenuItem item, MenuCategory category) async {
    var map = item.toMap();
    String? id = map.remove("id");
    await _db.collection(category.collection).doc(id).set(map);
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