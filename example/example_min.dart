import 'package:config_map/config_map.dart';

final myMapConfig = {
  'title': 'Title of book',
  'description': 'Description of book',
  'authors': 'John Author\nJain Author',
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

void printValue(dynamic value) {
  print('${value.runtimeType.toString()} ${value.toString()}');
}

void main() {
  final config = ConfigMap(json: myMapConfig, fields: fields);

  final title = config.get('title');
  final show = config.get('show');
  final count = config.get('count'); // 123
  final countInt = config.getAs<int>('count'); // 123
  final authors = config.get('authors'); // ['John Author', 'Jain Author']

  printValue(title); // 'Title of book' String?
  printValue(show); // true bool
  printValue(count); // 'Title of book' bool

  printValue(countInt); // 123 int
  printValue(authors); // ['John Author', 'Jain Author'] List<String>

  config.setSingle('count', 456);
  final String? countStr = config.getString('count'); // '456'
  final int countNext = config.getAs<int>('count'); // 456

  printValue(countStr); // '456' String
  printValue(countNext); // 456 int

  config.setList('authors', ['Bob', 'Bill']);
  final authorsNext = config.get('authors'); // ['Bob', 'Bill']
  final String? authorsStr = config.getString('authors'); // 'Bob\nBill'

  printValue(authorsNext); // ['Bob', 'Bill'] List<String>
  printValue(authorsStr); // 456 'Bob\nBill' String
}
