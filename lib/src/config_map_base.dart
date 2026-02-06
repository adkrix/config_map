import 'package:collection/collection.dart';
import 'package:config_map/config_map.dart';

class ConfigMap {
  late final List<ConfigMapItem> _fields;
  final ConfigMapJson json;
  late ConfigMapJson _json;

  ConfigMap({required List<ConfigMapItem> fields, this.json = const {}}) {
    _fields = fields;
    init(json);
  }

  static bool nulStrIsNotEmpty(String? str) => str != null && str != '';

  void init(ConfigMapJson json, {bool withMerge = false}) {
    if (!withMerge) {
      _json = {};
    }
    for (final field in _fields) {
      _json[field.name] = json[field.name];
    }
  }

  ConfigMapJson toJson({bool compact = false}) {
    final ConfigMapJson res = {};
    for (final field in _fields) {
      if (compact && _json[field.name] == null) continue;
      res[field.name] = _json[field.name];
    }
    return res;
  }

  List<ConfigMapItem> fields({bool used = true}) {
    return _fields.fold(<ConfigMapItem>[], (acc, key) {
      final inList = used ? _json[key.name] != null : _json[key.name] == null;
      return inList ? [...acc, key] : acc;
    });
  }

  bool has(String name) => toJson()[name] != null;

  ConfigMapItem? fieldByName(String name) =>
      _fields.where((field) => field.name == name).firstOrNull;

  bool available(String name) => fieldByName(name) != null;

  void setNulStr(String name, String? value) {
    if (available(name)) {
      _json[name] = value;
    }
  }

  String? getString(String name) => available(name) ? _json[name] : null;

  Object? get(String name) {
    final value = getString(name);

    if (value == null) return null;
    final field = _fields.firstWhereOrNull((field) => field.name == name);
    if (field == null) return null;

    switch (field.type) {
      case ConfigMapType.string:
      case ConfigMapType.multiline:
      case ConfigMapType.select:
        return value;
      case ConfigMapType.bool:
        return value == 'true';
      case ConfigMapType.strings:
      case ConfigMapType.multiselect:
        return value.split('\n').toList();
      case ConfigMapType.int:
      case ConfigMapType.intSelect:
        try {
          return int.parse(value);
        } catch (e) {
          return null;
        }
      case ConfigMapType.double:
      case ConfigMapType.doubleSelect:
        try {
          return double.parse(value);
        } catch (e) {
          return null;
        }
      case ConfigMapType.ints:
      case ConfigMapType.intMultiselect:
        try {
          return value.split('\n').map((item) => int.parse(item)).toList();
        } catch (e) {
          return null;
        }
      case ConfigMapType.doubles:
      case ConfigMapType.doubleMultiselect:
        try {
          return value.split('\n').map((item) => double.parse(item)).toList();
        } catch (e) {
          return null;
        }
    }
  }

  T getAs<T>(String name) => get(name) as T;

  void setAs<T>(String name, T value) {
    if (!available(name)) return;
    final field = fieldByName(name);
    if (field == null) return;
    String strVal = '';
    switch (field.type) {
      case ConfigMapType.bool:
        throw UnimplementedError();
      case ConfigMapType.string:
      case ConfigMapType.multiline:
      case ConfigMapType.select:
      // TODO: Handle this case.
      case ConfigMapType.int:
      case ConfigMapType.intSelect:
      case ConfigMapType.double:
      case ConfigMapType.doubleSelect:
        strVal = value.toString();

      case ConfigMapType.strings:
      case ConfigMapType.multiselect:
      case ConfigMapType.ints:
      case ConfigMapType.intMultiselect:
      case ConfigMapType.doubles:
      case ConfigMapType.doubleMultiselect:
        if (value is List) {
          strVal = value.map((item) => item.toString()).join('\n');
        } else {
          throw TypeError();
        }
    }

    setNulStr(name, strVal);
  }

  @override
  String toString() {
    return _json.entries
        .fold(<String>[], (acc, entry) {
          final inList = nulStrIsNotEmpty(entry.value);
          return inList ? [...acc, '${entry.key}: ${entry.value}'] : acc;
        })
        .join('\n');
  }
}
