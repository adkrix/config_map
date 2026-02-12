import 'package:config_map/config_map.dart';

final Map<String, ConfigMapItem> fieldMap = {
  'string': ConfigMapItem('string', type: ConfigMapTypes.string),
  'multiline': ConfigMapItem('multiline', type: ConfigMapTypes.multiline),
  'select': ConfigMapItem('select', type: ConfigMapTypes.select, options: {}),
  'bool': ConfigMapItem('bool', type: ConfigMapTypes.bool),
  'strings': ConfigMapItem('strings', type: ConfigMapTypes.strings),
  'multiselect': ConfigMapItem('multiselect', type: ConfigMapTypes.multiselect),
  'int': ConfigMapItem('int', type: ConfigMapTypes.int),
  'ints': ConfigMapItem('ints', type: ConfigMapTypes.ints),
  'double': ConfigMapItem('double', type: ConfigMapTypes.double),
  'doubles': ConfigMapItem('doubles', type: ConfigMapTypes.doubles),
  'intSelect': ConfigMapItem('intSelect', type: ConfigMapTypes.intSelect),
  'intMultiselect': ConfigMapItem(
    'intMultiselect',
    type: ConfigMapTypes.intMultiselect,
  ),
  'doubleSelect': ConfigMapItem(
    'doubleSelect',
    type: ConfigMapTypes.doubleSelect,
  ),
  'doubleMultiselect': ConfigMapItem(
    'doubleMultiselect',
    type: ConfigMapTypes.doubleMultiselect,
  ),
};

final ConfigMapJson nullMapConfig = {
  'string': null,
  'multiline': null,
  'select': null,
  'bool': null,
  'strings': null,
  'multiselect': null,
  'int': null,
  'ints': null,
  'double': null,
  'doubles': null,
  'intSelect': null,
  'intMultiselect': null,
  'doubleSelect': null,
  'doubleMultiselect': null,
};

final MapJson nullNaturalConfig = {
  'string': null,
  'multiline': null,
  'select': null,
  'bool': null,
  'strings': null,
  'multiselect': null,
  'int': null,
  'ints': null,
  'double': null,
  'doubles': null,
  'intSelect': null,
  'intMultiselect': null,
  'doubleSelect': null,
  'doubleMultiselect': null,
};
