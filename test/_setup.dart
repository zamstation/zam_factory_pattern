import 'package:zam_factory_pattern/zam_factory_pattern.dart';

class HondaCar {}

class HondaCity extends HondaCar {}

class HondaCivic extends HondaCar {}

class HondaAccord extends HondaCar {}

class HondaJazz extends HondaCar {}

class HondaCrv extends HondaCar {}

class HondaFactory extends TypedFactory<HondaCar> {
  const HondaFactory(Map<Type, Builder<HondaCar>> builders) : super(builders);
}

class ModifiableHondaFactory extends ModifiableFactory<Type, HondaCar> {
  const ModifiableHondaFactory(Map<Type, Builder<HondaCar>> builders)
      : super(builders);
}
