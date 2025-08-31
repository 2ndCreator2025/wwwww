// Utility functions for the Flutter app
import 'package:flutter/material.dart';

/// Custom utility class
class AppUtils {
  /// Get formatted counter text
  static String getCounterText(int count) {
    return 'Counter: $count';
  }
  
  /// Get counter color based on value
  static Color getCounterColor(int count) {
    if (count < 50) return Colors.green;
    if (count < 100) return Colors.orange;
    if (count < 150) return Colors.red;
    return Colors.purple;
  }
  
  /// Format timestamp
  static String formatTime(DateTime time) {
    return '${time.hour.toString().padLeft(2, '0')}:${time.minute.toString().padLeft(2, '0')}';
  }
  
  /// Get emoji based on counter value
  static String getCounterEmoji(int count) {
    if (count < 50) return '😊';
    if (count < 100) return '😐';
    if (count < 150) return '😱';
    return '🤯';
  }
}

/// Extension methods
extension IntExtensions on int {
  /// Check if number is even
  bool get isEven => this % 2 == 0;
  
  /// Check if number is odd
  bool get isOdd => this % 2 != 0;
  
  /// Get square of number
  int get squared => this * this;
  
  /// Check if number is prime (simple implementation)
  bool get isPrime {
    if (this < 2) return false;
    for (int i = 2; i <= this ~/ 2; i++) {
      if (this % i == 0) return false;
    }
    return true;
  }
}