import 'package:config_map/config_map.dart';

final Map<String, ConfigMapItem> fieldMap = {
  'string': ConfigMapItem('string', type: ConfigMapType.string),
  'multiline': ConfigMapItem('multiline', type: ConfigMapType.multiline),
  'select': ConfigMapItem('select', type: ConfigMapType.select, options: {}),
  'bool': ConfigMapItem('bool', type: ConfigMapType.bool),
  'strings': ConfigMapItem('strings', type: ConfigMapType.strings),
  'multiselect': ConfigMapItem('multiselect', type: ConfigMapType.multiselect),
  'int': ConfigMapItem('int', type: ConfigMapType.int),
  'ints': ConfigMapItem('ints', type: ConfigMapType.ints),
  'double': ConfigMapItem('double', type: ConfigMapType.double),
  'doubles': ConfigMapItem('doubles', type: ConfigMapType.doubles),
  'intSelect': ConfigMapItem('intSelect', type: ConfigMapType.intSelect),
  'intMultiselect': ConfigMapItem(
    'intMultiselect',
    type: ConfigMapType.intMultiselect,
  ),
  'doubleSelect': ConfigMapItem(
    'doubleSelect',
    type: ConfigMapType.doubleSelect,
  ),
  'doubleMultiselect': ConfigMapItem(
    'doubleMultiselect',
    type: ConfigMapType.doubleMultiselect,
  ),
};
