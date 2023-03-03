import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPref {

  addStringToSF(String token) async {
    debugPrint(token);
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('Bearer', token!);
  }

}
