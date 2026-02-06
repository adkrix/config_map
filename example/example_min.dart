import 'dart:convert';

import 'package:config_map/config_map.dart';

import 'const.dart';

List<ConfigMapItem> fieldList = [
  ConfigMapItem(fTitle, type: ConfigMapType.string),
  ConfigMapItem(fDescription, type: ConfigMapType.multiline),
  ConfigMapItem(fLanguage, type: ConfigMapType.select, options: langOptions),
  ConfigMapItem(fShow, type: ConfigMapType.bool),
  ConfigMapItem(fAuthors, type: ConfigMapType.strings),
  ConfigMapItem(fPublishers, type: ConfigMapType.multiselect),
  ConfigMapItem(fOrder, type: ConfigMapType.int),
  ConfigMapItem(fOrders, type: ConfigMapType.ints),
  ConfigMapItem(fPrice, type: ConfigMapType.double),
  ConfigMapItem(fPrices, type: ConfigMapType.doubles),
  ConfigMapItem(fCount, type: ConfigMapType.intSelect),
  ConfigMapItem(fCounts, type: ConfigMapType.intMultiselect),
  ConfigMapItem(fDiscount, type: ConfigMapType.doubleSelect),
  ConfigMapItem(fDiscounts, type: ConfigMapType.doubleMultiselect),
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
  emptyConfig.init(fullMapConfig);

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

  emptyConfig.init(resetMapConfig);
  for (final name in allFieldNames) {
    printVar(name, emptyConfig.get(name));
  }

  print('\nFields available for editing (not null) \n-------------------');
  print(emptyConfig.fields().map((field) => field.name).toList());

  print('\nFields disable for editing (null)\n-------------------');
  print(emptyConfig.fields(used: false).map((field) => field.name).toList());

  print('\ntoJson\n-------------------');

  print(encoder.convert(emptyConfig.toJson()));

  print('\ntoJson: compact\n-------------------');
  print(encoder.convert(emptyConfig.toJson(compact: true)));
}
