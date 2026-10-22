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

import 'package:cloud_firestore/cloud_firestore.dart';

Future<DocumentReference?> getExistingPinnedPostRef(
  DocumentReference communityRef,
) async {
  QuerySnapshot querySnapshot = await FirebaseFirestore.instance
      .collection('post') // تأكد أن الاسم 'post' صحيح
      .where('isPinned', isEqualTo: true) // الشرط الأول
      .where('post_community', isEqualTo: communityRef) // 2. الشرط الجديد
      .limit(1)
      .get();

  if (querySnapshot.docs.isNotEmpty) {
    return querySnapshot.docs.first.reference;
  } else {
    return null;
  }
}
// Set your action name, define your arguments and return parameter,
// and then add the boilerplate code using the green button on the right!
