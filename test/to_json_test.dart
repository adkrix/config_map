import 'package:config_map/config_map.dart';
import 'package:test/test.dart';

import 'const.dart';

void main() {
  group('To json', () {
    ConfigMap config = ConfigMap(fields: fieldMap.values.toList());

    setUp(() {
      config.init({});
    });

    test('Init empty', () {
      expect(config.toJson(compact: true), {});
    });

    test('Set accessible field', () {
      config.setNulStr('string', 'my test');
      expect(config.toJson(compact: true), {'string': 'my test'});
      expect(config.getString('string'), 'my test');
    });

    test('Set inaccessible field', () {
      config.setNulStr('wrong', 'my test');
      expect(config.toJson(compact: true), {});
      expect(config.getString('wrong'), null);
    });
  });
}
