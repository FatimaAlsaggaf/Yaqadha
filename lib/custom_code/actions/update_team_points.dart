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

Future<void> completeChallengeAndReward(
  DocumentReference currentUserRef,
  String communityId,
  int rewardPoints,
) async {
  final firestore = FirebaseFirestore.instance;

  // 1) حدّث حالة المستخدم أولاً
  await currentUserRef.update({'completed': true});

  // 2) اسحب القائمة بعد التحديث
  final membersSnapshot = await firestore
      .collection('Users')
      .where('communityId', isEqualTo: communityId)
      .get();

  final memberRefs = membersSnapshot.docs.map((d) => d.reference).toList();

  // 3) أعطِ النقاط للجميع
  await updateTeamPoints(memberRefs, rewardPoints);
}

Future<void> updateTeamPoints(
  List<DocumentReference> memberRefs,
  int rewardPoints,
) async {
  final firestore = FirebaseFirestore.instance;
  final batch = firestore.batch();

  if (memberRefs.isEmpty || rewardPoints == 0) return;

  for (final userRef in memberRefs) {
    batch.update(userRef, {
      'Points': FieldValue.increment(rewardPoints),
    });
  }

  await batch.commit();
}
