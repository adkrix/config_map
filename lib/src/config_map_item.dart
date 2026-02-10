import 'package:config_map/config_map.dart';

/// Single field setting
class ConfigMapItem {
  final String name;
  final ConfigMapTypes type;
  final Map<String, String>? options;

  /// Constructor
  ConfigMapItem(this.name, {this.type = ConfigMapTypes.string, this.options});
}
