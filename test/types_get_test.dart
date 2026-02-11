import 'package:config_map/config_map.dart';
import 'package:test/test.dart';

import 'const.dart';

void main() {
  group('check types', () {
    ConfigMap config = ConfigMap(fields: fieldMap.values.toList());

    setUp(() {
      config.initConfigJson({});
    });

    test('string', () {
      config.setNulStr('string', '"my test"');
      expect(config.getString('string'), '"my test"');
      final anyVal = config.get('string');
      expect(anyVal, 'my test');
      expect(anyVal.runtimeType.toString(), 'String');
      expect(config.getAs<String>('string'), 'my test');
    });

    test('Get with wrong type', () {
      config.setNulStr('string', '"256"');
      // field 'string' has String type
      expect(() => config.getAs<int>('string'), throwsA(isA<TypeError>()));
    });

    // multiline
    test('multiline', () {
      config.setNulStr('multiline', '"my test\\nNext line"');
      expect(config.getString('multiline'), '"my test\\nNext line"');
      final anyVal = config.get('multiline');
      print(anyVal);
      expect(anyVal, 'my test\nNext line');
      expect(anyVal.runtimeType.toString(), 'String');
      expect(config.getAs<String>('multiline'), 'my test\nNext line');
    });

    // select
    test('select', () {
      config.setNulStr('select', '"my test"');
      expect(config.getString('select'), '"my test"');
      final anyVal = config.get('select');
      expect(anyVal, 'my test');
      expect(anyVal.runtimeType.toString(), 'String');
      expect(config.getAs<String>('select'), 'my test');
    });

    // bool
    test('bool: true', () {
      config.setNulStr('bool', 'true');
      expect(config.getString('bool'), 'true');
      final anyVal = config.get('bool');
      expect(anyVal, true);
      expect(anyVal.runtimeType.toString(), 'bool');
      expect(config.getAs<bool>('bool'), true);
    });
    // strings
    test('strings single', () {
      config.setNulStr('strings', '["Single test"]');
      expect(config.getString('strings'), '["Single test"]');
      final anyVal = config.get('strings');
      expect(anyVal, ['Single test']);
      expect(anyVal.runtimeType.toString(), 'List<String>');
      expect(config.getAs<List<String>>('strings'), ['Single test']);
    });

    test('strings several items', () {
      config.setNulStr('strings', '["Single one","Single two"]');
      expect(config.getString('strings'), '["Single one","Single two"]');
      final anyVal = config.get('strings');
      expect(anyVal, ['Single one', 'Single two']);
      expect(anyVal.runtimeType.toString(), 'List<String>');
      expect(config.getAs<List<String>>('strings'), [
        'Single one',
        'Single two',
      ]);
    });

    // multiselect
    test('multiselect single', () {
      config.setNulStr('strings', '["Single test"]');
      expect(config.getString('strings'), '["Single test"]');
      final anyVal = config.get('strings');
      expect(anyVal, ['Single test']);
      expect(anyVal.runtimeType.toString(), 'List<String>');
      expect(config.getAs<List<String>>('strings'), ['Single test']);
    });

    test('multiselect multi', () {
      config.setNulStr('strings', '["Single one","Single two"]');
      expect(config.getString('strings'), '["Single one","Single two"]');
      final anyVal = config.get('strings');
      expect(anyVal, ['Single one', 'Single two']);
      expect(anyVal.runtimeType.toString(), 'List<String>');
      expect(config.getAs<List<String>>('strings'), [
        'Single one',
        'Single two',
      ]);
    });

    test('int', () {
      config.setNulStr('int', '42');
      expect(config.getString('int'), '42');
      final anyVal = config.get('int');
      expect(anyVal, 42);
      expect(anyVal.runtimeType.toString(), 'int');
      expect(config.getAs<int>('int'), 42);
    });

    test('ints', () {
      config.setNulStr('ints', '[42,43]');
      expect(config.getString('ints'), '[42,43]');
      final anyVal = config.get('ints');
      expect(anyVal, [42, 43]);
      expect(anyVal.runtimeType.toString(), 'List<int>');
      expect(config.getAs<List<int>>('ints'), [42, 43]);
    });

    test('double like int', () {
      config.setNulStr('double', '42');
      expect(config.getString('double'), '42');
      final anyVal = config.get('double');
      expect(anyVal, 42);
      expect(anyVal.runtimeType.toString(), 'double');
      expect(config.getAs<double>('double'), 42);
    });

    test('double with part', () {
      config.setNulStr('double', '42.2');
      expect(config.getString('double'), '42.2');
      final anyVal = config.get('double');
      expect(anyVal, 42.2);
      expect(anyVal.runtimeType.toString(), 'double');
      expect(config.getAs<double>('double'), 42.2);
    });

    test('doubles', () {
      config.setNulStr('doubles', '[42.2,42.3]');
      expect(config.getString('doubles'), '[42.2,42.3]');
      final anyVal = config.get('doubles');
      expect(anyVal, [42.2, 42.3]);
      expect(anyVal.runtimeType.toString(), 'List<double>');
      expect(config.getAs<List<double>>('doubles'), [42.2, 42.3]);
    });

    test('intSelect', () {
      config.setNulStr('intSelect', '42');
      expect(config.getString('intSelect'), '42');
      final anyVal = config.get('intSelect');
      expect(anyVal, 42);
      expect(anyVal.runtimeType.toString(), 'int');
      expect(config.getAs<int>('intSelect'), 42);
    });

    test('intMultiselect', () {
      config.setNulStr('intMultiselect', '[42,43]');
      expect(config.getString('intMultiselect'), '[42,43]');
      final anyVal = config.get('intMultiselect');
      expect(anyVal, [42, 43]);
      expect(anyVal.runtimeType.toString(), 'List<int>');
      expect(config.getAs<List<int>>('intMultiselect'), [42, 43]);
    });

    test('doubleSelect', () {
      config.setNulStr('doubleSelect', '42.2');
      expect(config.getString('doubleSelect'), '42.2');
      final anyVal = config.get('doubleSelect');
      expect(anyVal, 42.2);
      expect(anyVal.runtimeType.toString(), 'double');
      expect(config.getAs<double>('doubleSelect'), 42.2);
    });

    test('doubleMultiselect', () {
      config.setNulStr('doubleMultiselect', '[42.2,42.3]');
      expect(config.getString('doubleMultiselect'), '[42.2,42.3]');
      final anyVal = config.get('doubleMultiselect');
      expect(anyVal, [42.2, 42.3]);
      expect(anyVal.runtimeType.toString(), 'List<double>');
      expect(config.getAs<List<double>>('doubleMultiselect'), [42.2, 42.3]);
    });
  });
}
