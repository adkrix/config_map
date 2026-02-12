import 'package:config_map/config_map.dart';

import 'lib.dart';

final myMapConfig = {
  'title': '"Title of book"',
  'description': '"Description of book"',
  'authors': '["John Author","Jain Author"]',
  'show': 'true',
  'count': '123',
};

List<ConfigMapItem> fields = [
  ConfigMapItem('title', type: ConfigMapTypes.string),
  ConfigMapItem('description', type: ConfigMapTypes.multiline),
  ConfigMapItem('authors', type: ConfigMapTypes.strings),
  ConfigMapItem('show', type: ConfigMapTypes.bool),
  ConfigMapItem('count', type: ConfigMapTypes.int),
];

void main() {
  final config = ConfigMap(configJson: myMapConfig, fields: fields);

  final title = config.get('title');
  final show = config.get('show');
  final count = config.get('count'); // 123
  final countInt = config.getAs<int>('count'); // 123
  final authors = config.get('authors'); // ['John Author', 'Jain Author']

  printVar('title', title); // String       title = Title of book
  printVar('show', show); // bool         show = true
  printVar('count', count); // int          count = 123

  printVar('count :int', countInt); // int          count :int = 123
  printVar(
    'authors',
    authors,
  ); // List<String> authors = [John Author, Jain Author]

  config.setSingle('count', 456);
  final String? countStr = config.getString('count');
  final int countNext = config.getAs<int>('count');

  printVar('count :String', countStr); // String       count :String = 456
  printVar('count :next', countNext); // int          count :next = 456

  // ---
  config.setList('authors', ['Bob', 'Bill']);
  final authorsNext = config.get('authors');
  final String? authorsStr = config.getString('authors');

  printVar(
    'authors :next',
    authorsNext,
  ); // List<String> authors :next = [Bob, Bill]
  printVar(
    'authors :String',
    authorsStr,
  ); // String       authors :String = ["Bob","Bill"]
}
