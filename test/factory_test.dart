import 'package:zam_factory_pattern/zam_factory_pattern.dart';
import 'package:zam_test/zam_test.dart';

import '_setup.dart';

void main() {
  FactoryTestGroup().execute();
}

class FactoryTestGroup extends TestGroup {
  @override
  get name => 'Factory';

  static late HondaFactory factory;

  @override
  initializeForEveryTest() {
    factory = HondaFactory({
      HondaCity: () => HondaCity(),
      HondaCivic: () => HondaCivic(),
      HondaAccord: () => HondaAccord(),
    });
  }

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

class KeysTest extends Test<void, Iterable<Type>> {
  @override
  run(input) {
    return FactoryTestGroup.factory.keys;
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

class LengthTest extends Test<void, int> {
  @override
  run(input) {
    return FactoryTestGroup.factory.length;
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

class EmptyTest extends Test<void, bool> {
  @override
  run(input) {
    return FactoryTestGroup.factory.isEmpty;
  }

  @override
  final cases = [
    ValueTestCase(
      when: 'When one or more builders are provided',
      then: 'isEmpty should return false.',
      input: null,
      output: false,
    ),
  ];
}

class NotEmptyTest extends Test<void, bool> {
  @override
  run(input) {
    return FactoryTestGroup.factory.isNotEmpty;
  }

  @override
  final cases = [
    ValueTestCase(
      when: 'When one or more builders are provided',
      then: 'isNotEmpty should return true.',
      input: null,
      output: true,
    ),
  ];
}

class ContainsTest extends Test<Type, bool> {
  @override
  run(input) {
    return FactoryTestGroup.factory.contains(input);
  }

  @override
  final cases = [
    ValueTestCase(
      when: 'When an included key is searched for',
      then: 'contains should return true.',
      input: HondaCivic,
      output: true,
    ),
    ValueTestCase(
      when: 'When a non-included key is searched for',
      then: 'contains should return false.',
      input: Object,
      output: false,
    ),
  ];
}

class DoesNotContainTest extends Test<Type, bool> {
  @override
  run(input) {
    return FactoryTestGroup.factory.doesNotContain(input);
  }

  @override
  final cases = [
    ValueTestCase(
      when: 'When a non-included key is searched for',
      then: 'doesNotContain should return true.',
      input: Object,
      output: true,
    ),
  ];
}

class CreateInstanceTest extends Test<Type, HondaCar> {
  @override
  run(input) {
    return FactoryTestGroup.factory.createInstance(input);
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
