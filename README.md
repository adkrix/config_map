# Config map
Convert Map<String,String?> to object with multitype fields. Add ability to edit ones.

## Features
- Simple config (list)
- List of used and unused fields for creating of interactive forms ()
- Global getter and setter

## Getting started
```shell
dart pub add config_map
#or
flutter pub add config_map
```

## Usage
to `/example` folder. 

```dart
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

void main() {
  final config = ConfigMap(json: myMapConfig, fields: fields);

  final title = config.get('title');
  final show = config.get('show');
  final count = config.get('count'); // 123
  final countInt = config.getAs<int>('count'); // 123
  final authors = config.get('authors'); // ['John Author', 'Jain Author']

  print('${title.runtimeType} $title'); // 'Title of book' String?
  print('${show.runtimeType} ${show.toString()}'); // true bool
  print('${count.runtimeType} ${count.toString()}'); // 'Title of book' bool

  config.setSingle('count', 456);
  final String? countStr = config.getString('count'); // '456'
  final int countNext = config.getAs<int>('count'); // 456

  config.setList('author', ['Bob', 'Bill']);
  final authorsNext = config.get('authors'); // ['Bob', 'Bill']
  final String? authorsStr = config.getString('authors'); // 'Bob\nBill'
}
```

## Additional information

### enum ConfigMapType

| Enum type         | Dart type       | Widget               |
|-------------------|-----------------|----------------------|
| string            | String          | One-line TextField   |
| multiline         | String          | Multiline TextField  |
| select            | String          | Custom select Widget |
| bool              | bool            | Switch               |
| int               | int             | TextField            |
| intSelect         | int             | Custom select Widget |
| double            | double          | TextField            |
| doubleSelect      | double          | Custom select Widget |
| strings           | List&lt;String> | List of TextField    |
| multiselect       | List&lt;String> | Custom select Widget |
| ints              | List&lt;int>    | List of TextField    |
| intMultiselect    | List&lt;int>    | Custom select Widget |
| doubles           | List&lt;double> | List of TextField    |
| doubleMultiselect | List&lt;double> | Custom select Widget |

