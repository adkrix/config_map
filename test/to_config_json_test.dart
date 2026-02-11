import 'package:config_map/config_map.dart';
import 'package:test/test.dart';

import 'const.dart';

void main() {
  group('String', () {
    ConfigMap config = ConfigMap(fields: fieldMap.values.toList());

    setUp(() {
      config.initConfigJson({});
    });

    test('Init empty', () {
      expect(config.toConfigJson(compact: true), {});
    });

    test('Set inaccessible field', () {
      config.setNulStr('wrong', 'my test');
      expect(config.toConfigJson(compact: true), {});
      expect(config.getString('wrong'), null);
    });
  });

  group('Type string', () {
    ConfigMap config = ConfigMap(fields: fieldMap.values.toList());
    setUp(() => config.initConfigJson({}));

    test('Set accessible field', () {
      config.setNulStr('string', '"my test"');
      expect(config.toConfigJson(compact: true), {'string': '"my test"'});
      expect(config.toJson(compact: true), {'string': 'my test'});
      expect(config.getString('string'), '"my test"');
      expect(config.get('string'), 'my test');
    });

    test('init natural json with accessible field', () {
      config.initJson({'string': 'my test'});
      expect(config.toConfigJson(compact: true), {'string': '"my test"'});
      expect(config.toJson(compact: true), {'string': 'my test'});
      expect(config.getString('string'), '"my test"');
      expect(config.get('string'), 'my test');
    });

    test('init config json with accessible field', () {
      config.initConfigJson({'string': '"my test"'});
      expect(config.toConfigJson(compact: true), {'string': '"my test"'});
      expect(config.toJson(compact: true), {'string': 'my test'});
      expect(config.getString('string'), '"my test"');
      expect(config.get('string'), 'my test');
    });
  });

  group('Type strings', () {
    ConfigMap config = ConfigMap(fields: fieldMap.values.toList());
    setUp(() => config.initConfigJson({}));

    test('Set accessible field', () {
      config.setNulStr('strings', '["my test"]');
      expect(config.toConfigJson(compact: true), {'strings': '["my test"]'});
      expect(config.toJson(compact: true), {
        'strings': ['my test'],
      });
      expect(config.getString('strings'), '["my test"]');
      expect(config.get('strings'), ['my test']);
    });

    test('init natural json accessible field', () {
      config.initJson({
        'strings': ['my test'],
      });
      expect(config.toConfigJson(compact: true), {'strings': '["my test"]'});
      expect(config.toJson(compact: true), {
        'strings': ['my test'],
      });
      expect(config.getString('strings'), '["my test"]');
      expect(config.get('strings'), ['my test']);
    });

    test('init config json accessible field', () {
      config.initConfigJson({'strings': '["my test"]'});
      expect(config.toConfigJson(compact: true), {'strings': '["my test"]'});
      expect(config.toJson(compact: true), {
        'strings': ['my test'],
      });
      expect(config.getString('strings'), '["my test"]');
      expect(config.get('strings'), ['my test']);
    });
  });

  group('Type bool', () {
    ConfigMap config = ConfigMap(fields: fieldMap.values.toList());
    setUp(() => config.initConfigJson({}));

    test('Set accessible field', () {
      config.setNulStr('bool', 'true');
      expect(config.toConfigJson(compact: true), {'bool': 'true'});
      expect(config.toJson(compact: true), {'bool': true});
      expect(config.getString('bool'), 'true');
      expect(config.get('bool'), true);
    });

    test('init natural json accessible field', () {
      config.initJson({'bool': true});
      expect(config.toConfigJson(compact: true), {'bool': 'true'});
      expect(config.toJson(compact: true), {'bool': true});
      expect(config.getString('bool'), 'true');
      expect(config.get('bool'), true);
    });

    test('init config json accessible field', () {
      config.initConfigJson({'bool': 'true'});
      expect(config.toConfigJson(compact: true), {'bool': 'true'});
      expect(config.toJson(compact: true), {'bool': true});
      expect(config.getString('bool'), 'true');
      expect(config.get('bool'), true);
    });
  });

  group('Type int', () {
    ConfigMap config = ConfigMap(fields: fieldMap.values.toList());
    setUp(() => config.initConfigJson({}));

    test('Set accessible field', () {
      config.setNulStr('int', '123');
      expect(config.toConfigJson(compact: true), {'int': '123'});
      expect(config.toJson(compact: true), {'int': 123});
      expect(config.getString('int'), '123');
      expect(config.get('int'), 123);
    });

    test('init natural json accessible field', () {
      config.initJson({'int': 123});
      expect(config.toConfigJson(compact: true), {'int': '123'});
      expect(config.toJson(compact: true), {'int': 123});
      expect(config.getString('int'), '123');
      expect(config.get('int'), 123);
    });

    test('init config json accessible field', () {
      config.initConfigJson({'int': '123'});
      expect(config.toConfigJson(compact: true), {'int': '123'});
      expect(config.toJson(compact: true), {'int': 123});
      expect(config.getString('int'), '123');
      expect(config.get('int'), 123);
    });
  });

  group('Type ints', () {
    ConfigMap config = ConfigMap(fields: fieldMap.values.toList());
    setUp(() => config.initConfigJson({}));

    test('Set accessible field', () {
      config.setNulStr('ints', '[123]');
      expect(config.toConfigJson(compact: true), {'ints': '[123]'});
      expect(config.toJson(compact: true), {
        'ints': [123],
      });
      expect(config.getString('ints'), '[123]');
      expect(config.get('ints'), [123]);
    });

    test('init natural json accessible field', () {
      config.initJson({
        'ints': [123],
      });
      expect(config.toConfigJson(compact: true), {'ints': '[123]'});
      expect(config.toJson(compact: true), {
        'ints': [123],
      });
      expect(config.getString('ints'), '[123]');
      expect(config.get('ints'), [123]);
    });

    test('init config json accessible field', () {
      config.initConfigJson({'ints': '[123]'});
      expect(config.toConfigJson(compact: true), {'ints': '[123]'});
      expect(config.toJson(compact: true), {
        'ints': [123],
      });
      expect(config.getString('ints'), '[123]');
      expect(config.get('ints'), [123]);
    });
  });

  group('Type double', () {
    ConfigMap config = ConfigMap(fields: fieldMap.values.toList());
    setUp(() => config.initConfigJson({}));

    test('Set accessible field', () {
      config.setNulStr('double', '123.23');
      expect(config.toConfigJson(compact: true), {'double': '123.23'});
      expect(config.toJson(compact: true), {'double': 123.23});
      expect(config.getString('double'), '123.23');
      expect(config.get('double'), 123.23);
    });

    test('init natural json accessible field', () {
      config.initJson({'double': 123.23});
      expect(config.toConfigJson(compact: true), {'double': '123.23'});
      expect(config.toJson(compact: true), {'double': 123.23});
      expect(config.getString('double'), '123.23');
      expect(config.get('double'), 123.23);
    });

    test('init config json accessible field', () {
      config.initConfigJson({'double': '123.23'});
      expect(config.toConfigJson(compact: true), {'double': '123.23'});
      expect(config.toJson(compact: true), {'double': 123.23});
      expect(config.getString('double'), '123.23');
      expect(config.get('double'), 123.23);
    });
  });

  group('Type doubles', () {
    ConfigMap config = ConfigMap(fields: fieldMap.values.toList());
    setUp(() => config.initConfigJson({}));

    test('Set accessible field', () {
      config.setNulStr('doubles', '[123.3]');
      expect(config.toConfigJson(compact: true), {'doubles': '[123.3]'});
      expect(config.toJson(compact: true), {
        'doubles': [123.3],
      });
      expect(config.getString('doubles'), '[123.3]');
      expect(config.get('doubles'), [123.3]);
    });

    test('init natural json accessible field', () {
      config.initJson({
        'doubles': [123.3],
      });
      expect(config.toConfigJson(compact: true), {'doubles': '[123.3]'});
      expect(config.toJson(compact: true), {
        'doubles': [123.3],
      });
      expect(config.getString('doubles'), '[123.3]');
      expect(config.get('doubles'), [123.3]);
    });

    test('init config json accessible field', () {
      config.initConfigJson({'doubles': '[123.3]'});
      expect(config.toConfigJson(compact: true), {'doubles': '[123.3]'});
      expect(config.toJson(compact: true), {
        'doubles': [123.3],
      });
      expect(config.getString('doubles'), '[123.3]');
      expect(config.get('doubles'), [123.3]);
    });
  });
}
