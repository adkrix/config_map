typedef ConfigMapJson = Map<String, String?>;

enum ConfigMapType {
  /// parsing as <b>String</b>
  string,

  /// parsing as <b>String</b>
  multiline,

  /// parsing as <b>String</b>
  select,

  /// parsing as <b>bool</b>
  bool,

  /// parsing as <b>int</b>
  int,

  /// parsing as <b>int</b>
  intSelect,

  /// parsing as <b>double</b>
  double,

  /// parsing as <b>double</b>
  doubleSelect,

  /// parsing as <b>List&lt;String></b>
  strings,

  /// parsing as <b>List&lt;String></b>
  multiselect,

  /// parsing as <b>List&lt;int></b>
  ints,

  /// parsing as <b>List&lt;int></b>
  intMultiselect,

  /// parsing as <b>List&lt;double></b>
  doubles,

  /// parsing as <b>List&lt;double></b>
  doubleMultiselect,
}
