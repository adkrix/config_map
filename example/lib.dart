void printVar(String name, dynamic variable) {
  print(
    '${variable.runtimeType.toString().padRight(12)} $name = ${variable.toString()}',
  );
}
