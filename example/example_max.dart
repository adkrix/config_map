import 'dart:convert';

import 'package:config_map/config_map.dart';

import 'const.dart';

List<ConfigMapItem> fieldList = [
  ConfigMapItem(fTitle), // default type: ConfigMapTypes.string
  ConfigMapItem(fDescription, type: ConfigMapTypes.multiline),
  ConfigMapItem(fLanguage, type: ConfigMapTypes.select, options: langOptions),
  ConfigMapItem(fShow, type: ConfigMapTypes.bool),
  ConfigMapItem(fAuthors, type: ConfigMapTypes.strings),
  ConfigMapItem(fPublishers, type: ConfigMapTypes.multiselect),
  ConfigMapItem(fOrder, type: ConfigMapTypes.int),
  ConfigMapItem(fOrders, type: ConfigMapTypes.ints),
  ConfigMapItem(fPrice, type: ConfigMapTypes.double),
  ConfigMapItem(fPrices, type: ConfigMapTypes.doubles),
  ConfigMapItem(fCount, type: ConfigMapTypes.intSelect),
  ConfigMapItem(fCounts, type: ConfigMapTypes.intMultiselect),
  ConfigMapItem(fDiscount, type: ConfigMapTypes.doubleSelect),
  ConfigMapItem(fDiscounts, type: ConfigMapTypes.doubleMultiselect),
];

//
extension ConfigMapGetter on ConfigMap {
  String? get description => getAs<String?>(fTitle) ?? 'null-null';
}

// custom class with hardcoded field list (if static options)
class CustomConfigMap extends ConfigMap {
  CustomConfigMap({super.json}) : super(fields: fieldList);

  String? get title => getAs<String?>(fTitle);
  // String? get description => getAs<String?>(fDescription);
  List<String>? get authors => getAs<List<String>?>(fAuthors);
  bool get show => getAs<bool>(fShow);
  int get order => getAs<int?>(fOrder) ?? 0; // with default value
  double? get price => getAs<double?>(fPrice);
  List<int>? get orders => getAs<List<int>?>(fOrders);
  List<double>? get prices => getAs<List<double>?>(fPrices);
}

void printVar(String name, dynamic variable) {
  print(
    '${variable.runtimeType.toString().padRight(12)} $name = ${variable.toString()}',
  );
}

void main() {
  var encoder = const JsonEncoder.withIndent('  ');

  final config = CustomConfigMap(json: fullMapConfig);

  print('Config with data (use getter)\n-------------------');
  printVar('title', config.title);
  printVar('description', config.description);
  printVar('authors', config.authors);
  printVar('show', config.show);
  printVar('order', config.order);
  printVar('price', config.price);
  printVar('orders', config.orders);
  printVar('prices', config.prices);

  print('\nEmpty config and init data  later\n');
  final emptyConfig = CustomConfigMap();
  emptyConfig.initConfigJson(fullMapConfig);

  print('\nEmpty config get as string \n-------------------');
  for (final name in allFieldNames) {
    printVar(name, emptyConfig.getString(name));
  }

  print('\nSet field as any type \n-------------------');
  emptyConfig.setNulStr(fShow, 'false');

  for (final name in allFieldNames) {
    printVar(name, emptyConfig.get(name));
  }

  print('\nEmpty config reset \n-------------------');

  emptyConfig.initConfigJson(resetMapConfig);
  for (final name in allFieldNames) {
    printVar(name, emptyConfig.get(name));
  }

  print('\nFields available for editing (not null) \n-------------------');
  print(emptyConfig.fields().map((field) => field.name).toList());

  print('\nFields disable for editing (null)\n-------------------');
  print(emptyConfig.fields(used: false).map((field) => field.name).toList());

  print('\ntoJson\n-------------------');

  print(encoder.convert(emptyConfig.toConfigJson()));

  print('\ntoJson: compact\n-------------------');
  print(encoder.convert(emptyConfig.toConfigJson(compact: true)));
}
