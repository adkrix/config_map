import 'package:config_map/config_map.dart';

/// Single field setting
class ConfigMapItem {
  /// field name
  final String name;

  /// field type
  final ConfigMapTypes type;

  /// options for select fields
  final Map<String, String>? options;

  /// Constructor
  ConfigMapItem(this.name, {this.type = ConfigMapTypes.string, this.options});
}
