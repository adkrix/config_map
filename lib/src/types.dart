/// Storing type
typedef MapJson = Map<String, Object?>;

typedef ConfigMapJson = Map<String, String?>;

/// Field types for getter, setter and form generation
enum ConfigMapTypes {
  /// parsing as `String`
  string,

  /// parsing as `String`
  multiline,

  /// parsing as `String`
  select,

  /// parsing as `bool` for Switch widget
  bool,

  /// parsing as `bool` for Checkbox widget
  check,

  /// parsing as `int`
  int,

  /// parsing as `int`
  intSelect,

  /// parsing as <b>double</b>
  double,

  /// parsing as `double`
  doubleSelect,

  /// parsing as `List<String>`
  strings,

  /// parsing as `List<String>`
  multiselect,

  /// parsing as `List<int>`
  ints,

  /// parsing as `List<int>`
  intMultiselect,

  /// parsing as `List<double>`
  doubles,

  /// parsing as `List<double>`
  doubleMultiselect,

  //
  // map `Map<String, String>`
  // intMap `Map<String, int>`
  // doubleMap `Map<String, double>`
  // boolMap `Map<String, bool>`
}

/// List of single fields
const mapTypesAsSingle = {
  ConfigMapTypes.string,
  ConfigMapTypes.multiline,
  ConfigMapTypes.select,
  ConfigMapTypes.bool,
  ConfigMapTypes.int,
  ConfigMapTypes.intSelect,
  ConfigMapTypes.double,
  ConfigMapTypes.doubleSelect,
};

/// List of iterable fields
const mapTypesAsList = {
  ConfigMapTypes.strings,
  ConfigMapTypes.multiselect,
  ConfigMapTypes.ints,
  ConfigMapTypes.intMultiselect,
  ConfigMapTypes.doubles,
  ConfigMapTypes.doubleMultiselect,
};
