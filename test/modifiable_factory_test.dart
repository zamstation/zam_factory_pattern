// ignore_for_file: prefer_void_to_null

import 'package:zam_test/zam_test.dart';

import 'test_data/factory.test_data.dart';
import 'test_data/modifiable_factory.test_data.dart';

void main() {
  TestGroup('ModifiableFactory', [
    MergeWithTest(),
    ClearTest(),
  ]).execute();
}

class MergeWithTest extends Test<Null, int> {
  @override
  run(input) {
    final factory = getFactoryTestData();
    final modifiableFactory = getModifiableFactoryTestData();
    modifiableFactory.mergeWith(factory);
    return modifiableFactory.length;
  }

  @override
  final cases = [
    ValueTestCase(
      when:
          'When a factory with M builders is merged with a factory with N builders',
      then: 'length should be M+N.',
      input: null,
      output: 5,
    ),
  ];
}

class ClearTest extends Test<Null, bool> {
  @override
  run(input) {
    final modifiableFactory = getModifiableFactoryTestData();
    modifiableFactory.clear();
    return modifiableFactory.isEmpty;
  }

  @override
  final cases = [
    BooleanTestCase.truthy(
      when: 'When a modifiable factory is cleared, isEmpty',
      input: null,
    ),
  ];
}
