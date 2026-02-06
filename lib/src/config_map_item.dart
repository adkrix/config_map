import 'package:config_map/config_map.dart';

class ConfigMapItem {
  final String name;
  final ConfigMapType type;
  final Map<String, String>? options;

  ConfigMapItem(this.name, {this.type = ConfigMapType.string, this.options});
}
