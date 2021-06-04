import 'package:zam_test/zam_test.dart';

import '_setup.dart';

void main() {
  TestGroup('ModifiableFactory', [
    MergeWithTest(),
    ClearTest(),
  ]).execute();
}

class MergeWithTest extends Test<void, int> {
  @override
  run(input) {
    final factory = HondaFactory({
      HondaCity: () => HondaCity(),
      HondaCivic: () => HondaCivic(),
      HondaAccord: () => HondaAccord(),
    });
    final modifiableFactory = ModifiableHondaFactory({
      HondaJazz: () => HondaJazz(),
      HondaCrv: () => HondaCrv(),
    });
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

class ClearTest extends Test<void, bool> {
  @override
  run(input) {
    final modifiableFactory = ModifiableHondaFactory({
      HondaJazz: () => HondaJazz(),
      HondaCrv: () => HondaCrv(),
    });
    modifiableFactory.clear();
    return modifiableFactory.isEmpty;
  }

  @override
  final cases = [
    ValueTestCase(
      when: 'When a modifiable factory is cleared',
      then: 'isEmpty should return true.',
      input: null,
      output: true,
    ),
  ];
}
