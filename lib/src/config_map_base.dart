import 'package:collection/collection.dart';
import 'package:config_map/config_map.dart';
import 'utils.dart';

class ConfigMap {
  late final List<ConfigMapItem> _fields;
  final ConfigMapJson json;
  late ConfigMapJson _json;

  ConfigMap({required List<ConfigMapItem> fields, this.json = const {}}) {
    _fields = fields;
    init(json);
  }

  static bool nulStrIsNotEmpty(String? str) => str != null && str != '';

  /// Set/reset new json object which using for storing data
  void init(ConfigMapJson json, {bool withMerge = false}) {
    if (!withMerge) {
      _json = {};
    }
    for (final field in _fields) {
      _json[field.name] = json[field.name];
    }
  }

  /// Export json object for storing. Full and compact
  ConfigMapJson toJson({bool compact = false}) {
    final ConfigMapJson res = {};
    for (final field in _fields) {
      if (compact && _json[field.name] == null) continue;
      res[field.name] = _json[field.name];
    }
    return res;
  }

  /// Return set or unset fields for external editing form. Use key `used`
  List<ConfigMapItem> fields({bool used = true}) {
    return _fields.fold(<ConfigMapItem>[], (acc, key) {
      final inList = used ? _json[key.name] != null : _json[key.name] == null;
      return inList ? [...acc, key] : acc;
    });
  }

  /// Check if the field is set
  bool has(String name) => toJson()[name] != null;

  /// Check field by name in fields set
  ConfigMapItem? fieldByName(String name) =>
      _fields.where((field) => field.name == name).firstOrNull;

  /// Check if the field is available for current fields setting
  bool available(String name) => fieldByName(name) != null;

  /// Set any set value as `String` the way the value is stored internally
  void setNulStr(String name, String? value) {
    if (available(name)) {
      _json[name] = value;
    }
  }

  /// Get any value as `String` the way the value is stored internally
  String? getString(String name) => available(name) ? _json[name] : null;

  /// Get preset value with preset type (own for each field)
  Object? get(String name) {
    final value = getString(name);

    if (value == null) return null;
    final field = _fields.firstWhereOrNull((field) => field.name == name);
    if (field == null) return null;

    switch (field.type) {
      case ConfigMapTypes.string:
      case ConfigMapTypes.multiline:
      case ConfigMapTypes.select:
        return value;
      case ConfigMapTypes.bool:
        return value == 'true';
      case ConfigMapTypes.strings:
      case ConfigMapTypes.multiselect:
        return value.split('\n').toList();
      case ConfigMapTypes.int:
      case ConfigMapTypes.intSelect:
        try {
          return int.parse(value);
        } catch (e) {
          return null;
        }
      case ConfigMapTypes.double:
      case ConfigMapTypes.doubleSelect:
        try {
          return double.parse(value);
        } catch (e) {
          return null;
        }
      case ConfigMapTypes.ints:
      case ConfigMapTypes.intMultiselect:
        try {
          return value.split('\n').map((item) => int.parse(item)).toList();
        } catch (e) {
          return null;
        }
      case ConfigMapTypes.doubles:
      case ConfigMapTypes.doubleMultiselect:
        try {
          return value.split('\n').map((item) => double.parse(item)).toList();
        } catch (e) {
          return null;
        }
    }
  }

  /// Get field value with generic type. Can generate exception TypeError.
  T getAs<T>(String name) => get(name) as T;

  /// Set single `value` on key `name`. Value can be simple type `int` || `double` || `String` || `bool`
  void setSingle(String name, dynamic value) {
    final singleType = isSingleType(value);
    final field = fieldByName(name);
    if (field == null ||
        !mapTypesAsSingle.contains(field.type) ||
        !singleType) {
      throw TypeError();
    }
    setNulStr(name, value.toString());
  }

  /// Set list `value` on key `name`. Value can be List of simple type `int` || `double` || `String` || `bool`
  void setList(String name, List<dynamic> value) {
    final field = fieldByName(name);
    if (field == null || !mapTypesAsList.contains(field.type)) {
      throw TypeError();
    }
    final converted = value
        .map((item) {
          return item.toString();
        })
        .join('\n');
    setNulStr(name, converted);
  }

  // void setMap(String name, Map<String, dynamic> value) for `map`, `intMap`, `doubleMap`, `boolMap`

  /// Convert json object to string ignoring keys with null.
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
