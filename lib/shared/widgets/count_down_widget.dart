import 'dart:async';

import 'package:flutter/material.dart';
import 'package:app_skeleton/config/style/text_style.dart';
import 'package:app_skeleton/core/logging/logger.dart';

/// A countdown timer widget that displays remaining time in minutes and seconds.
/// The timer can be started, stopped, and reset.
///  example:
/// ```dart
/// CountdownTimer(
///   seconds: 120, // 2 minutes
///   onComplete: () {
///     // Callback when the timer completes
///   },
/// ),
/// ```

class CountdownTimer extends StatefulWidget {
  /// The initial number of seconds for the countdown.
  final int seconds;

  /// Callback function called when the countdown completes.
  final VoidCallback? onComplete;

  const CountdownTimer({
    super.key,
    required this.seconds,
    this.onComplete,
  });

  @override
  CountdownTimerState createState() => CountdownTimerState();
}

class CountdownTimerState extends State<CountdownTimer> {
  late int remainingSeconds;
  Timer? timer;

  @override
  void initState() {
    super.initState();
    remainingSeconds = widget.seconds;
  }

  /// Starts the countdown timer.
  void startTimer() {
    if (timer != null && timer!.isActive) return;

    timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (remainingSeconds > 0) {
        setState(() {
          remainingSeconds--;
        });
      } else {
        timer.cancel();
        widget.onComplete?.call();
      }
    });
  }

  /// Stops the countdown timer.
  void stopTimer() {
    timer?.cancel();
  }

  /// Resets the countdown timer to its initial state.
  void resetTimer() {
    stopTimer();
    setState(() {
      remainingSeconds = widget.seconds;
    });
  }

  @override
  void dispose() {
    timer?.cancel();
    Logger.debug('Countdown timer disposed');
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Text(
      formatTime(remainingSeconds),
      style: AppTextStyle.s16W300,
    );
  }

  /// Formats the remaining time into a readable string (mm:ss).
  String formatTime(int seconds) {
    final minutes = (seconds ~/ 60).toString().padLeft(2, '0');
    final secs = (seconds % 60).toString().padLeft(2, '0');
    return '$minutes:$secs';
  }
}
