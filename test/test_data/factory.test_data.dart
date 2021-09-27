import '../_setup.dart';

HondaFactory getFactoryTestData() {
  return HondaFactory({
    HondaCity: () => HondaCity(),
    HondaCivic: () => HondaCivic(),
    HondaAccord: () => HondaAccord(),
  });
}
