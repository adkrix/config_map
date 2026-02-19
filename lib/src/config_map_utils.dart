import 'dart:convert';

/// Convert data utils (parsing JSON string and return typed value)
class ConfigMapUtils {
  ConfigMapUtils._();

  /// Parse boolean value from JSON string
  static bool parseBool(String value) => value == 'true';

  /// Parse string value from JSON string
  static String? parseString(String value, {bool throwError = false}) {
    try {
      return jsonDecode(value);
    } catch (e) {
      if (throwError) throw TypeError();
      return null;
    }
  }

  /// Parse string list value from JSON string
  static List<String>? parseStringList(
    String value, {
    bool throwError = false,
  }) {
    try {
      final list = jsonDecode(value);
      return List<String>.from(list);
    } catch (e) {
      if (throwError) throw TypeError();
      return null;
    }
  }

  /// Parse integer value from JSON string
  static int? parseInt(String value, {bool throwError = false}) {
    try {
      return int.parse(value);
    } catch (e) {
      if (throwError) throw TypeError();
      return null;
    }
  }

  /// Parse double value (with decimal) from JSON string
  static double? parseDouble(String value, {bool throwError = false}) {
    try {
      return double.parse(value);
    } catch (e) {
      if (throwError) throw TypeError();
      return null;
    }
  }

  /// Parse int list value from JSON string
  static List<int>? parseIntList(String value, {bool throwError = false}) {
    final list = jsonDecode(value);
    try {
      return List<int>.from(list);
    } catch (e) {
      if (throwError) throw TypeError();
      return null;
    }
  }

  /// Parse double list value from JSON string
  static List<double>? parseDoubleList(
    String value, {
    bool throwError = false,
  }) {
    final list = jsonDecode(value);

    try {
      return List<double>.from(list);
    } catch (e) {
      if (throwError) throw TypeError();
      return null;
    }
  }
}
