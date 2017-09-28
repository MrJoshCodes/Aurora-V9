import 'dart:math';

class StringUtils {
  static String substring(String string, int start, int length) {
    return string.substring(start, min(start + length, string.length));
  }
}