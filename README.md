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
TODO: Include short and useful examples for package users. Add longer examples
to `/example` folder. 

```dart
// <T extends Enum>
final myMapConfig = {
  'title': 'Title of book',
  'description': 'Description of book', 
  'authors': 'John Author\nJain Author',
  'show': 'true',
};

enum FieldNames {
  title,description, authors, show
}
List<ConfigMapItem> fields = [
  ConfigMapItem(FieldNames.title, ConfigMapType.text),
  ConfigMapItem(FieldNames.description, ConfigMapType.multiline),
  ConfigMapItem(FieldNames.authors, ConfigMapType.strings),
  ConfigMapItem(FieldNames.show, ConfigMapType.bool),
];

final config = ConfigMap<FieldNames>(fields, json: myMapConfig);

final String title = config.get(FieldNames.title);
final bool show = config.get(FieldNames.show);
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

 

