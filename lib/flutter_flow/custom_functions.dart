import 'dart:convert';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'lat_lng.dart';
import 'place.dart';
import 'uploaded_file.dart';
import '/backend/backend.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '/backend/schema/structs/index.dart';
import '/auth/firebase_auth/auth_util.dart';

String getCurrentTimeSlot() {
  // Return a String based on the current hour (24h).  Use these slots: '8 AM Slot' (8-11), '12 PM Slot' (12-15), '4 PM Slot' (16-19), '8 PM Slot' (20-23).  For hours 0 to 7 (reset period), return 'Waiting for 8 AM'.
  final hour = DateTime.now().hour;

  if (hour >= 8 && hour < 12) {
    return '8 AM Slot';
  } else if (hour >= 12 && hour < 16) {
    return '12 PM Slot';
  } else if (hour >= 16 && hour < 20) {
    return '4 PM Slot';
  } else if (hour >= 20 && hour < 24) {
    return '8 PM Slot';
  } else {
    return 'Waiting for 8 AM';
  }
}

List<DateTime> getCurrentWeekDates(int weekOffset) {
  // 1. تحديد التاريخ المستهدف بعد تطبيق الإزاحة
  DateTime now = DateTime.now();
  DateTime targetDate = now.add(Duration(days: weekOffset * 7));

  // 2. حساب اليوم الأول في الأسبوع المستهدف

  // دالة weekday في Dart ترجع: 1 (الإثنين) إلى 7 (الأحد).
  // daysToSubtract هو عدد الأيام للعودة إلى يوم الإثنين (1).
  int currentWeekday = targetDate.weekday;

  // إذا كان اليوم هو الإثنين (1)، يجب أن تكون daysToSubtract صفر.
  // إذا كان اليوم هو الأحد (7)، يجب أن تكون daysToSubtract ستة (7-1).
  int daysToSubtract = currentWeekday - 1;

  // اليوم الأول في الأسبوع المستهدف (الإثنين)
  DateTime firstDayOfWeek = targetDate.subtract(Duration(days: daysToSubtract));

  // 3. إنشاء قائمة التواريخ للأسبوع
  List<DateTime> calendarDates = [];

  for (int i = 0; i < 7; i++) {
    // إضافة الأيام السبعة بدءاً من اليوم الأول
    DateTime dateToAdd = firstDayOfWeek.add(Duration(days: i));
    // نحتاج فقط للتاريخ، بدون معلومات الوقت المعقدة، لذا ننظف الوقت إلى منتصف الليل (00:00:00)
    calendarDates.add(DateTime(dateToAdd.year, dateToAdd.month, dateToAdd.day));
  }

  // 4. إرجاع قائمة تواريخ الأسبوع المحدد
  return calendarDates;
}

bool? isCurrentDay(DateTime dateToCheck) {
  final now = DateTime.now();
  return dateToCheck.year == now.year &&
      dateToCheck.month == now.month &&
      dateToCheck.day == now.day;
}

bool? areDatesTheSame(
  DateTime? date1,
  DateTime? date2,
) {
  // Check if either date is null to avoid errors.
  if (date1 == null || date2 == null) {
    return false;
  }
  // Compare only the year, month, and day.
  return date1.year == date2.year &&
      date1.month == date2.month &&
      date1.day == date2.day;
}

bool? isFutureDate(DateTime? dateToCheck) {
// MODIFIY CODE ONLY BELOW THIS LINE

  if (dateToCheck == null) {
    return false;
  }

// Get current date and time
  final now = DateTime.now();

// Get today's date at midnight for comparison
  final today = DateTime(now.year, now.month, now.day);

// Get the selected date at midnight for comparison
  final toCheck =
      DateTime(dateToCheck.year, dateToCheck.month, dateToCheck.day);

// --- START OF NEW LOGIC ---

// 1. If the selected date is in the future, always show the widget.
  if (toCheck.isAfter(today)) {
    return true;
  }

// 2. If the selected date is in the past, always hide the widget.
  if (toCheck.isBefore(today)) {
    return false;
  }

// 3. If we are here, it means the selected date IS TODAY.
// Now, we apply your time-based rule.

// Create a DateTime object for 8:00 AM today
  final eightAMToday = DateTime(now.year, now.month, now.day, 8); // 8:00:00 AM

// Check if the current time (now) is before 8:00 AM.
// If it's 7:59 AM, this will be true (widget appears).
// If it's 8:00 AM or 8:01 AM, this will be false (widget disappears).
  return now.isBefore(eightAMToday);

// --- END OF NEW LOGIC ---
}

String getCurrentTimeSlott() {
  // Return a String based on the current hour (24h clock). Use these slots: '8 AM Slot' (hours 8-11), '12 PM Slot' (12-15), '4 PM Slot' (16-19), '8 PM Slot' (20-23). For all other hours (0-7), return 'Waiting for 8 AM'.
  final hour = DateTime.now().hour;

  if (hour >= 8 && hour < 12) {
    return '8 AM Slot';
  } else if (hour >= 12 && hour < 16) {
    return '12 PM Slot';
  } else if (hour >= 16 && hour < 20) {
    return '4 PM Slot';
  } else if (hour >= 20 && hour < 24) {
    return '8 PM Slot';
  } else {
    return 'Waiting for 8 AM';
  }
}

DateTime? getStartOfDay(DateTime? date) {
  if (date == null) {
    return null;
  }
  return DateTime(date.year, date.month, date.day, 0, 0, 0);
}

DateTime? getEndOfDay(DateTime? date) {
  DateTime? getEndOfDay(DateTime? date) {
    // If the date is null, return null to avoid errors.
    if (date == null) {
      return null;
    }
    // Return a new DateTime with the same year, month, and day, but at time 23:59:59.
    return DateTime(date.year, date.month, date.day, 23, 59, 59);
  }
}

int dailyCommunityGoal(
  String communityId,
  int steps,
) {
  final now = DateTime.now();

  // إذا الوقت 12:00 صباحًا (بداية اليوم)
  if (now.hour == 0) {
    return 0;
  }

  return steps;
}

int timeSlotToHour(String timeSlotString) {
  // Generate Custom Widget. **timeSlotToHour** function must convert '8 AM Slot', '12 PM Slot', '4 PM Slot', '8 PM Slot' to **8, 12, 16, 20** (Integer) for logic.
  switch (timeSlotString) {
    case '1 AM Slot':
      return 1;
    case '12 PM Slot':
      return 12;
    case '4 PM Slot':
      return 16;
    case '8 PM Slot':
      return 20;
    default:
      throw ArgumentError('Invalid time slot: $timeSlotString');
  }
}

String? newCustomFunction() {
  // Generate two FlutterFlow Custom Functions in Dart (return-only code; no imports or comments). Must compile natively, no async, no packages.  bool isNowBetween(int startHour, int endHour): return true when local time is within [startHour:00, endHour:00). Use DateTime.now(); 24-hour format; treat endHour==24 as end of day.  bool isPastSlot(int endHour): return true when now ≥ today at endHour:00; if endHour==24, return false.  Functions will drive conditional visibility and gray styling UI
  bool isNowBetween(int startHour, int endHour) {
    final hour = DateTime.now().hour;
    if (endHour == 24) return hour >= startHour && hour < 24;
    return hour >= startHour && hour < endHour;
  }

  bool isPastSlot(int endHour) {
    final hour = DateTime.now().hour;
    if (endHour == 24) return false;
    return hour >= endHour;
  }
}

DocumentReference? newCustomFunction2(String? userID) {
  return FirebaseFirestore.instance.collection('users').doc(userID!);
}

bool? isBeforeRegistration(
  DateTime? dateToCheck,
  DateTime? registrationDate,
) {
  // إذا كان أي من التاريخين غير موجود، قم بإخفاء الويدجت
  if (dateToCheck == null || registrationDate == null) {
    return false;
  }

  // --- تسوية التواريخ (للمقارنة بدون وقت) ---

  // 1. جلب تاريخ اليوم الحالي (عند منتصف الليل)
  final now = DateTime.now();
  final today = DateTime(now.year, now.month, now.day);

  // 2. جلب التاريخ المراد فحصه (عند منتصف الليل)
  final toCheck =
      DateTime(dateToCheck.year, dateToCheck.month, dateToCheck.day);

  // 3. جلب تاريخ تسجيل المستخدم (عند منتصف الليل)
  final regDate = DateTime(
      registrationDate.year, registrationDate.month, registrationDate.day);

  // --- تطبيق المنطق ---

  // الشرط الأول: هل التاريخ المحدد "في الماضي" (قبل اليوم)؟
  bool isPast = toCheck.isBefore(today);

  // الشرط الثاني: هل التاريخ المحدد "قبل تاريخ التسجيل"؟
  bool isBeforeReg = toCheck.isBefore(regDate);

  // أرجع "صحيح" (true) فقط إذا كان التاريخ في الماضي *و* قبل تاريخ التسجيل
  return isPast && isBeforeReg;
}

List<DateTime>? modify(DateTime? referenceDate) {
// Check if the input date is null. If so, use today's date.
  DateTime dateToUse = referenceDate ?? DateTime.now();

// Find the start of the week (Sunday)
// ...
// This helps us subtract the right number of days to get back to Sunday.
  DateTime startOfWeek =
      dateToUse.subtract(Duration(days: dateToUse.weekday % 7));

// Create a list to hold the 7 days of the week
  List<DateTime> weekDates = [];

// Generate the dates for the 7 days of the week starting from Sunday
  for (int i = 0; i < 7; i++) {
    weekDates.add(startOfWeek.add(Duration(days: i)));
  }

  return weekDates;
}

String? getDynamicCountdown() {
// 1. Get the current time
  DateTime now = DateTime.now();

  // 2. Define today's milestones
  DateTime today8AM = DateTime(now.year, now.month, now.day, 8, 0, 0);
  DateTime today12PM = DateTime(now.year, now.month, now.day, 12, 0, 0);
  DateTime today4PM = DateTime(now.year, now.month, now.day, 16, 0, 0);
  DateTime today8PM = DateTime(now.year, now.month, now.day, 20, 0, 0);

  // هذا هو المتغير الجديد المهم: منتصف الليل (بداية اليوم التالي)
  DateTime tonightMidnight =
      DateTime(now.year, now.month, now.day + 1, 0, 0, 0);

  DateTime targetTime;

  // 3. Decide which milestone is next
  if (now.isBefore(today8AM)) {
    // إذا كنا في الصباح الباكر (مثلاً الساعة ١ الفجر)، الهدف هو ٨ الصباح
    targetTime = today8AM;
  } else if (now.isBefore(today12PM)) {
    targetTime = today12PM;
  } else if (now.isBefore(today4PM)) {
    targetTime = today4PM;
  } else if (now.isBefore(today8PM)) {
    targetTime = today8PM;
  } else if (now.isBefore(tonightMidnight)) {
    // إذا كانت الساعة بين ٨ مساءً و ١٢ منتصف الليل، الهدف هو منتصف الليل
    targetTime = tonightMidnight;
  } else {
    // حالة احتياطية نادرة جداً، تعود للهدف الصباحي
    targetTime = today8AM.add(const Duration(days: 1));
  }

  // 4. Calculate remaining time
  Duration remaining = targetTime.difference(now);
  int totalSeconds = remaining.inSeconds.abs();

  // 5. Format as HH:MM:SS
  int hours = totalSeconds ~/ 3600;
  int minutes = (totalSeconds % 3600) ~/ 60;
  int seconds = totalSeconds % 60;

  String twoDigits(int n) => n.toString().padLeft(2, '0');
  return "${twoDigits(hours)}:${twoDigits(minutes)}:${twoDigits(seconds)}";
}

bool? hasStreakBroken(DateTime? lastDate) {
  if (lastDate == null) return true;

  final now = DateTime.now();
  final lastDateLocal =
      lastDate.toLocal(); // يجب استخدام التوقيت المحلي للمقارنة

  // 1. حساب الفرق في الأيام الكاملة (للتصدي لحالات الانقطاع الحاد)
  final today = DateTime(now.year, now.month, now.day);
  final last =
      DateTime(lastDateLocal.year, lastDateLocal.month, lastDateLocal.day);
  final differenceInDays = today.difference(last).inDays;

  // 2. التحقق من الانقطاع إذا فات أكثر من يوم كامل
  if (differenceInDays > 1) {
    return true; // انقطع الستريك بالتأكيد
  }

  // 3. التحقق من انقطاع 24 ساعة (عندما يكون الفرق يوماً واحداً)
  if (differenceInDays == 1) {
    final durationSinceLastCompletion = now.difference(lastDateLocal);

    // إذا مر 24 ساعة كاملة أو أكثر من آخر إنجاز، ينقطع الستريك
    if (durationSinceLastCompletion.inHours >= 24) {
      return true;
    }
  }

  // 4. الستريك مستمر (الفرق 0، أو الفرق 1 لكن لم تمر 24 ساعة بعد)
  return false;
}

DateTime getLastMonthDateTime(DateTime inputDate) {
  int year = inputDate.year;
  int month = inputDate.month;

  if (month == 1) {
    year--;
    month = 12;
  } else {
    month--;
  }
  return DateTime(year, month);
}

DateTime getNextMonthDateTime(DateTime inputDate) {
  int year = inputDate.year;
  int month = inputDate.month;

  if (month == 12) {
    year++;
    month = 1;
  } else {
    month++;
  }
  return DateTime(year, month);
}

List<CalendarDayStruct> getCalendarForMonth(DateTime inputDate) {
  // NOTE: Since recording the episode it was spotted that the AI code which was
  // generated did not correctly support an additional row for months which Sunday
  // is the 1st day of the month. It resulted in the last line not being generated.
  // The code below replaces the AI code which was generated in Episode 2
  // Sorry for any confusion.

  List<CalendarDayStruct> calendar = [];

  // Start by finding the first day of the current month
  DateTime firstOfMonth = DateTime(inputDate.year, inputDate.month, 1);

  // Find the last day of the current month
  DateTime lastOfMonth = DateTime(inputDate.year, inputDate.month + 1, 0);

  // Find the first Monday on or before the first of the month
  DateTime startCalendar =
      firstOfMonth.subtract(Duration(days: firstOfMonth.weekday - 1));

  // Find the last Sunday after the end of the month
  DateTime endCalendar = lastOfMonth.weekday == 7
      ? lastOfMonth
      : lastOfMonth.add(Duration(days: 7 - lastOfMonth.weekday));

  // Populate the calendar
  for (DateTime date = startCalendar;
      date.isBefore(endCalendar.add(Duration(days: 1)));
      date = date.add(Duration(days: 1))) {
    bool isPreviousMonth = date.isBefore(firstOfMonth);
    bool isNextMonth = date.isAfter(lastOfMonth);

    CalendarDayStruct dayStruct = CalendarDayStruct(
        calendarDate: date,
        isPreviousMonth: isPreviousMonth,
        isNextMonth: isNextMonth);

    calendar.add(dayStruct);
  }

  return calendar;
}

DocumentReference? newCustomFunction3(DocumentReference? commentRef) {
  return commentRef;
}

bool? shouldShowChallenge(
  DateTime? challengeDate,
  bool? isActive,
) {
  // 1. إذا لم يكن هناك تاريخ أو حالة، نعتبره غير صالح للعرض
  if (challengeDate == null || isActive == null) {
    return false;
  }

  // 2. التحقق هل التاريخ هو اليوم؟
  final now = DateTime.now();
  bool isToday = challengeDate.year == now.year &&
      challengeDate.month == now.month &&
      challengeDate.day == now.day;

  // 3. المعادلة النهائية: لازم يكون اليوم + لازم يكون أكتف
  // إذا تحقق الشرطان ترجع true (اظهر التحدي)
  // إذا اختل أي شرط ترجع false (اظهر الفورم)
  return isToday && isActive;
}

String? getEndOfChallCom(DateTime? challengeDate) {
  if (challengeDate == null) {
    return "Done";
  }

  DateTime endOfDay = DateTime(
      challengeDate.year, challengeDate.month, challengeDate.day + 1, 0, 0, 0);

  DateTime now = DateTime.now();
  Duration difference = endOfDay.difference(now);

  if (difference.isNegative) {
    return "0h 0m 0s left";
  }

  // تم إضافة الثواني هنا
  return "${difference.inHours}h ${difference.inMinutes.remainder(60)}m ${difference.inSeconds.remainder(60)}s left";
}

double getDayProgress(
  DateTime calendarDate,
  List<ChallengeHistoryRecord> historyDocs,
) {
  // 1. تحويل تاريخ الكالندر إلى نص يطابق الموجود في الداتابيس
  // في الصورة عندك التاريخ مخزن بصيغة: "yyyy-MM-dd"
  String dateString = DateFormat('yyyy-MM-dd').format(calendarDate);

  // 2. فلترة المستندات الخاصة بهذا اليوم فقط
  var dayTasks = historyDocs.where((doc) => doc.forDate == dateString).toList();

  // إذا لم يكن هناك مهام لهذا اليوم، النسبة 0
  if (dayTasks.isEmpty) {
    return 0.0;
  }

  // 3. حساب عدد المهام المكتملة
  // حسب الصورة الحقل هو status والقيمة "Completed"
  var completedTasks =
      dayTasks.where((doc) => doc.status == "\"Completed\"").toList();

  // 4. حساب النسبة (المكتمل / الكل)
  // مثال: لو عندك 3 مهام، وخلصت 1، النتيجة 0.33
  // لو هدفك مهمة واحدة فقط في اليوم، النتيجة ستكون إما 0.0 أو 1.0
  return completedTasks.length / dayTasks.length;
}

String getRemainingTimeMonth(DateTime endTime) {
  var now = DateTime.now();
  var diff = endTime.difference(now);

  if (diff.isNegative) {
    return "Ended";
  }

  // حساب الأيام والساعات والدقائق
  int days = diff.inDays;
  int hours = diff.inHours % 24;
  int minutes = diff.inMinutes % 60;

  // تنسيق الأرقام لتكون خانتين (مثلاً 05 بدل 5)
  String h = hours.toString().padLeft(2, '0');
  String m = minutes.toString().padLeft(2, '0');

  // النتيجة ستظهر بهذا الشكل: 15d : 04h : 20m
  return '$days d : ${h}h : ${m}m';
}

RegionalChallengesRecord? getChallengeByRank(
  List<DocumentReference> challengesList,
  int rank,
) {
  // 1. نسخ القائمة عشان نقدر نرتبها
  var sortedList = List<RegionalChallengesRecord>.from(challengesList);

  // 2. الترتيب تنازلياً حسب عدد المشاركين (الأكثر فالأقل)
  sortedList.sort((a, b) {
    int countA = a.participantsCount; // تأكدي أن اسم الحقل هنا مطابق للداتابيس
    int countB = b.participantsCount;
    return countB.compareTo(countA); // ترتيب تنازلي
  });

  // 3. التحقق هل الرتبة المطلوبة موجودة؟
  // (rank - 1) لأن البرمجة تبدأ من 0، فالمركز 1 هو الاندكس 0
  int index = rank - 1;

  if (index >= 0 && index < sortedList.length) {
    return sortedList[index];
  }

  // 4. إذا الرتبة غير موجودة (مثلاً طلبنا الثالث وحنا عندنا بس مدينتين)
  return null;
}

String? notificationBody(String? commname) {
  return "You still have an incomplete challenge in $commname.";
}

int? remainingSteps(
  int goal,
  int steps,
) {
  final remaining = goal - steps;
  return remaining < 0 ? 0 : remaining;
}
