import 'package:config_map/config_map.dart';
import 'package:test/test.dart';

import 'const.dart';

void main() {
  group('To json', () {
    ConfigMap config = ConfigMap(fields: fieldMap.values.toList());

    setUp(() {
      config.initConfigJson({});
    });

    test('Init empty', () {
      expect(config.toConfigJson(compact: true), {});
    });

    test('Set accessible field', () {
      config.setNulStr('string', '"my test"');
      expect(config.toConfigJson(compact: true), {'string': '"my test"'});
    });

    test('Set inaccessible field', () {
      config.setNulStr('wrong', 'my test');
      expect(config.toConfigJson(compact: true), {});
      expect(config.getString('wrong'), null);
    });
  });
}
