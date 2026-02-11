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
      config.setSingle('string', 'test string');

      expect(config.getString('string'), '"test string"');
      expect(config.getAs<String>('string'), 'test string');
    });

    test('multiline', () {
      config.setSingle('multiline', 'test string');

      expect(config.getString('multiline'), '"test string"');
      expect(config.getAs<String>('multiline'), 'test string');
    });

    test('select', () {
      config.setSingle('select', 'test string');

      expect(config.getString('select'), '"test string"');
      expect(config.getAs<String>('select'), 'test string');
    });

    test('bool', () {
      config.setSingle('bool', true);

      expect(config.getString('bool'), 'true');
      expect(config.getAs<bool>('bool'), true);
    });

    test('strings', () {
      config.setList('strings', ['one', 'two']);

      expect(config.getString('strings'), '["one","two"]');
      expect(config.getAs<List<String>>('strings'), ['one', 'two']);
    });

    test('multiselect', () {
      config.setList('multiselect', ['one', 'two']);

      expect(config.getString('multiselect'), '["one","two"]');
      expect(config.getAs<List<String>>('multiselect'), ['one', 'two']);
    });

    test('int', () {
      config.setSingle('int', 124);

      expect(config.getString('int'), '124');
      expect(config.getAs<int>('int'), 124);
    });

    test('ints', () {
      config.setList('ints', [125, 126]);

      expect(config.getString('ints'), '[125,126]');
      expect(config.getAs<List<int>>('ints'), [125, 126]);
    });

    test('double', () {
      config.setSingle('double', 124.2);

      expect(config.getString('double'), '124.2');
      expect(config.getAs<double>('double'), 124.2);
    });

    test('doubles', () {
      config.setList('doubles', [125.2, 126.2]);

      expect(config.getString('doubles'), '[125.2,126.2]');
      expect(config.getAs<List<double>>('doubles'), [125.2, 126.2]);
    });

    test('intSelect', () {
      config.setSingle('intSelect', 124);

      expect(config.getString('intSelect'), '124');
      expect(config.getAs<int>('intSelect'), 124);
    });

    test('intMultiselect', () {
      config.setList('intMultiselect', [125, 126]);

      expect(config.getString('intMultiselect'), '[125,126]');
      expect(config.getAs<List<int>>('intMultiselect'), [125, 126]);
    });

    test('doubleSelect', () {
      config.setSingle('doubleSelect', 124.2);

      expect(config.getString('doubleSelect'), '124.2');
      expect(config.getAs<double>('doubleSelect'), 124.2);
    });

    test('doubleMultiselect', () {
      config.setList('doubleMultiselect', [125.2, 126.2]);

      expect(config.getString('doubleMultiselect'), '[125.2,126.2]');
      expect(config.getAs<List<double>>('doubleMultiselect'), [125.2, 126.2]);
    });
    // -----------
  });
}
