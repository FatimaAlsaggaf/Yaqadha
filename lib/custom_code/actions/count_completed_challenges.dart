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

Future<int> countCompletedChallenges(
  BuildContext context,
  DocumentReference userRef,
) async {
  // --- الكولكشن الأول (تحديات الماضي) ---
  CollectionReference pastChallenges =
      userRef.collection('challenge_history'); // تأكد أن هذا الاسم صحيح

  // --- الكولكشن الثاني (تحديات اليوم) ---
  // !! غيّر الاسم التالي للاسم الصحيح لكولكشن اليوم !!
  CollectionReference todayChallenges = userRef.collection('challenges');

  // !! غيّر الكلمة التالية إذا كانت مختلفة عندك (مثل "finished" أو "done") !!
  String completedStatus = "\"Completed\"";

  try {
    // 1. جلب العدد "Completed" من الكولكشن الأول
    Query pastQuery =
        pastChallenges.where('status', isEqualTo: completedStatus);
    QuerySnapshot pastSnapshot = await pastQuery.get();
    int totalPastCompleted = pastSnapshot.size;

    // 2. جلب العدد "Completed" من الكولكشن الثاني
    Query todayQuery =
        todayChallenges.where('status', isEqualTo: completedStatus);
    QuerySnapshot todaySnapshot = await todayQuery.get();
    int totalTodayCompleted = todaySnapshot.size;

    // 3. جمع العددين وإرجاع المجموع
    return totalPastCompleted + totalTodayCompleted;
  } catch (e) {
    // في حال حدوث خطأ
    print('Error counting total completed challenges: $e');
    return 0;
  }
}
