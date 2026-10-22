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

import 'package:cloud_firestore/cloud_firestore.dart'; // ضروري جداً

Future<int> countActiveChallenges(
  BuildContext context,
  DocumentReference userRef,
) async {
  // تعريف الكولكشن الأول (السجل)
  CollectionReference historyRef = userRef.collection('challenge_history');

  // تعريف الكولكشن الثاني (تحديات اليوم - إذا كنت تستخدمه)
  CollectionReference todayRef = userRef.collection('challenges');

  // !! مهم: تأكد أن الكلمة هنا تطابق الموجود في الداتابيس تماماً (active صغيرة)
  String targetStatus = "active";

  try {
    // 1. البحث في السجل (History)
    QuerySnapshot historyQuery =
        await historyRef.where('status', isEqualTo: targetStatus).get();
    int historyCount = historyQuery.docs.length;

    // 2. البحث في تحديات اليوم (Today)
    // إذا لم يكن لديك كولكشن اسمه challenges، سيعود هذا بصفر ولن يضر
    QuerySnapshot todayQuery =
        await todayRef.where('status', isEqualTo: targetStatus).get();
    int todayCount = todayQuery.docs.length;

    // جمع الرقمين وإرجاع الناتج
    return historyCount + todayCount;
  } catch (e) {
    // في حال حدوث خطأ، اطبعه في الكونسول وأرجع صفر
    print('Error counting active challenges: $e');
    return 0;
  }
}
// Set your action name, define your arguments and return parameter,
// and then add the boilerplate code using the green button on the right!
