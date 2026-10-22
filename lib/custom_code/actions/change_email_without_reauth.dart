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

import '/custom_code/actions/index.dart';
import '/flutter_flow/custom_functions.dart';
// DO NOT REMOVE THE ABOVE

import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

Future<String?> changeEmailWithoutReauth(String newEmail) async {
  final auth = FirebaseAuth.instance;
  final user = auth.currentUser;
  if (user == null) return 'غير مسجل دخول';

  try {
    // 1. طلب تحديث الإيميل مباشرة (بدون إعادة توثيق هنا)
    await user.updateEmail(newEmail);

    // 2. إرسال رسالة تحقق للإيميل الجديد (اختياري لكن موصى به)
    await user.sendEmailVerification();

    // 3. إعادة تحميل بيانات المستخدم للتأكد من التحديث
    await user.reload();
    final updated = auth.currentUser;
    final updatedEmail = updated?.email;

    // 4. تحديث مستند المستخدم في Firestore إذا تغيّر الإيميل
    if (updatedEmail != null) {
      final docRef =
          FirebaseFirestore.instance.collection('users').doc(updated!.uid);
      await docRef.update({'email': updatedEmail});
    }

    return 'done'; // نجاح
  } on FirebaseAuthException catch (e) {
    // من الأخطاء الشائعة: requires-recent-login
    return e.code; // إرجاع كود الخطأ للتعامل في الواجهة
  } catch (e) {
    return e.toString();
  }
}
