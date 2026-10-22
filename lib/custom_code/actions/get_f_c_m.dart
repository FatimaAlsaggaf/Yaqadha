// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

// Write a FlutterFlow Custom Action in Dart named getFCM. Import FlutterFlow default files and firebase_messaging. Create Future<String> getFCM() async that gets the FirebaseMessaging instance, calls getToken(), saves it in a token variable, and returns it
import 'package:firebase_messaging/firebase_messaging.dart';

Future<String> getFCM(String uid) async {
  FirebaseMessaging messaging = FirebaseMessaging.instance;
  String? token = await messaging.getToken();
  return token ?? '';
}
