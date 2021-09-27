import '../_setup.dart';

ModifiableHondaFactory getModifiableFactoryTestData() {
  return ModifiableHondaFactory({
    HondaJazz: () => HondaJazz(),
    HondaCrv: () => HondaCrv(),
  });
}
