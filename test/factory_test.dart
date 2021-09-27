// ignore_for_file: prefer_void_to_null

import 'package:zam_factory_pattern/zam_factory_pattern.dart';
import 'package:zam_test/zam_test.dart';

import '_setup.dart';
import 'test_data/factory.test_data.dart';

void main() {
  FactoryTestGroup().execute();
}

class FactoryTestGroup extends TestGroup {
  @override
  get name => 'Factory';

  @override
  get tests => [
        KeysTest(),
        LengthTest(),
        EmptyTest(),
        NotEmptyTest(),
        ContainsTest(),
        DoesNotContainTest(),
        CreateInstanceTest(),
      ];

  FactoryTestGroup() : super.empty();
}

class KeysTest extends Test<Null, Iterable<Type>> {
  @override
  run(input) {
    return getFactoryTestData().keys;
  }

  @override
  final cases = [
    ValueTestCase(
      when: 'When factory.keys is called',
      then: 'the provided list of builder keys should be retrieved.',
      input: null,
      output: [HondaCity, HondaCivic, HondaAccord],
    ),
  ];
}

class LengthTest extends Test<Null, int> {
  @override
  run(input) {
    return getFactoryTestData().length;
  }

  @override
  final cases = [
    ValueTestCase(
      when: 'When N builders are provided',
      then: 'length should be N.',
      input: null,
      output: 3,
    ),
  ];
}

class EmptyTest extends Test<Null, bool> {
  @override
  run(input) {
    return getFactoryTestData().isEmpty;
  }

  @override
  final cases = [
    BooleanTestCase.falsy(
      when: 'isEmpty',
      input: null,
    ),
  ];
}

class NotEmptyTest extends Test<Null, bool> {
  @override
  run(input) {
    return getFactoryTestData().isNotEmpty;
  }

  @override
  final cases = [
    BooleanTestCase.truthy(
      when: 'isNotEmpty',
      input: null,
    ),
  ];
}

class ContainsTest extends Test<Type, bool> {
  @override
  run(input) {
    return getFactoryTestData().contains(input);
  }

  @override
  final cases = [
    BooleanTestCase.truthy(
      when: 'For an existing key, contain',
      input: HondaCivic,
    ),
    BooleanTestCase.falsy(
      when: 'For a non-existing key, contain',
      input: Object,
    ),
  ];
}

class DoesNotContainTest extends Test<Type, bool> {
  @override
  run(input) {
    return getFactoryTestData().doesNotContain(input);
  }

  @override
  final cases = [
    BooleanTestCase.truthy(
      when: 'For a non-existing key, doesNotContain',
      input: Object,
    ),
    BooleanTestCase.falsy(
      when: 'For an existing key, doesNotContain',
      input: HondaCivic,
    ),
  ];
}

class CreateInstanceTest extends Test<Type, HondaCar> {
  @override
  run(input) {
    return getFactoryTestData().createInstance(input);
  }

  @override
  final cases = [
    TestCase(
      when: 'When an included key is provided',
      then: 'createInstance should create an instance.',
      input: HondaAccord,
      matcher: isA<HondaAccord>(),
    ),
    NegativeTestCase(
      when: 'When a non-included key is provided',
      input: Object,
      exception: BuilderNotFoundInFactoryException,
    ),
  ];
}
