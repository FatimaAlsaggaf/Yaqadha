import 'package:flutter/foundation.dart';
import 'dart:async';
import 'dart:math';
import 'package:sensors_plus/sensors_plus.dart';
import 'package:shared_preferences/shared_preferences.dart';

class StepDetector {
  static final StepDetector _i = StepDetector._();
  StepDetector._();
  factory StepDetector() => _i;

  double threshold = 50;
  int minStepIntervalMs = 2000;
  double alpha = 0.9;
  bool debug = true;
  StreamSubscription<UserAccelerometerEvent>? _sub;
  Timer? _saveTimer;
  Timer? _resetTimer;

  int _steps = 0;
  DateTime _lastStepTs = DateTime.fromMillisecondsSinceEpoch(0);

  static const _kStepsKey = 'steps_today';
  static const _kLastResetKey = 'steps_last_reset';

  bool get isRunning => _sub != null;
  int get steps => _steps;

  String _dayKey8AM(DateTime now) {
    final today = DateTime(now.year, now.month, now.day);
    final midnight = DateTime(now.year, now.month, now.day, 0);

    final effective = now.isBefore(midnight)
        ? today.subtract(const Duration(days: 1))
        : today;

    return '${effective.year}-${effective.month.toString().padLeft(2, '0')}-${effective.day.toString().padLeft(2, '0')}';
  }

  Future<void> _loadCache() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      _steps = prefs.getInt(_kStepsKey) ?? 0;

      final lastReset = prefs.getString(_kLastResetKey);
      final currentKey = _dayKey8AM(DateTime.now());
      if (lastReset == null || lastReset != currentKey) {
        _steps = 0;
        await _saveCache();
      }
    } catch (e) {
      debugPrint('Error loading step cache: $e');
    }
  }

  Future<void> _saveCache() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      await prefs.setInt(_kStepsKey, _steps);
      await prefs.setString(_kLastResetKey, _dayKey8AM(DateTime.now()));
      if (debug) debugPrint('Saved steps: $_steps');
    } catch (e) {
      debugPrint('Error saving step cache: $e');
    }
  }

  Future<void> _checkResetAt8AM() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final lastReset = prefs.getString(_kLastResetKey);
      final currentKey = _dayKey8AM(DateTime.now());
      if (lastReset != currentKey) {
        _steps = 0;
        await _saveCache();
        if (debug) debugPrint('8AM reset applied');
      }
    } catch (e) {
      debugPrint('Error checking reset: $e');
    }
  }

  Future<void> start({int autosaveSeconds = 30}) async {
    if (_sub != null) {
      if (debug) debugPrint('StepDetector already running');
      return;
    }
    await _loadCache();
    if (debug) debugPrint('StepDetector starting...');

    // 👇 استخدم userAccelerometer (بدون الجاذبية)
    _sub = userAccelerometerEventStream().listen((e) {
      // مقدار التسارع بدون الجاذبية
      final mag = sqrt(e.x * e.x + e.y * e.y + e.z * e.z);

      // لو تحبي فلترة إضافية خفيفة (اختياري):
      // final filtered = alpha * _prevFiltered + (1 - alpha) * mag;

      final now = DateTime.now();
      final dt = now.difference(_lastStepTs).inMilliseconds;

      if (mag > threshold && dt >= minStepIntervalMs) {
        _steps++;
        _lastStepTs = now;
        if (debug) debugPrint('Step! total=$_steps (mag=$mag, dt=$dt ms)');
      }
    }, onError: (e) {
      debugPrint('userAccelerometer error: $e');
    });

    _saveTimer = Timer.periodic(
      Duration(seconds: autosaveSeconds),
      (_) => _saveCache(),
    );

    _resetTimer = Timer.periodic(
      const Duration(minutes: 1),
      (_) => _checkResetAt8AM(),
    );
  }

  Future<void> stop() async {
    if (debug) debugPrint('StepDetector stopping...');
    await _sub?.cancel();
    _sub = null;
    _saveTimer?.cancel();
    _resetTimer?.cancel();
    await _saveCache();
  }

  Future<void> reset([int to = 0]) async {
    _steps = to;
    await _saveCache();
  }

  Future<int> getStepsToday() async {
    await _checkResetAt8AM();
    return _steps;
  }
}
