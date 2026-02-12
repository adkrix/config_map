import 'dart:convert';

class ConfigMapUtils {
  static bool parseBool(String value) => value == 'true';

  static String? parseString(String value, {bool throwError = false}) {
    try {
      return jsonDecode(value);
    } catch (e) {
      if (throwError) throw TypeError();
      return null;
    }
  }

  static List<String>? parseStringList(
    String value, {
    bool throwError = false,
  }) {
    final list = jsonDecode(value);
    try {
      return List<String>.from(list);
    } catch (e) {
      if (throwError) throw TypeError();
      return null;
    }
  }

  static int? parseInt(String value, {bool throwError = false}) {
    try {
      return int.parse(value);
    } catch (e) {
      if (throwError) throw TypeError();
      return null;
    }
  }

  static double? parseDouble(String value, {bool throwError = false}) {
    try {
      return double.parse(value);
    } catch (e) {
      if (throwError) throw TypeError();
      return null;
    }
  }

  static List<int>? parseIntList(String value, {bool throwError = false}) {
    final list = jsonDecode(value);
    try {
      return List<int>.from(list);
    } catch (e) {
      if (throwError) throw TypeError();
      return null;
    }
  }

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
