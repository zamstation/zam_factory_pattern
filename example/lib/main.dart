import 'package:zam_factory_pattern/zam_factory_pattern.dart';

// Create the base class.
class HondaCar {
  void startEngine() {
    print('$runtimeType: Engine Started');
  }
}

// Create child classes.
class HondaCity extends HondaCar {}

class HondaCivic extends HondaCar {}

class HondaAccord extends HondaCar {}

class HondaJazz extends HondaCar {}

class HondaCrv extends HondaCar {}

// Create the factory.
class HondaFactory extends TypedFactory<HondaCar> {
  const HondaFactory(Map<Type, Builder<HondaCar>> builders) : super(builders);
}

// Create modifiable factory using ModifiableFactoryMixin.
class ModifiableHondaFactory extends HondaFactory with ModifiableFactoryMixin {
  const ModifiableHondaFactory(Map<Type, Builder<HondaCar>> builders)
      : super(builders);
}

// Now let's see what the library can provide.
void main() {
  //
  // Factory
  //
  print('HondaFactory:\n');

  print('- Creating HondaFactory');
  final hondaFactory = HondaFactory({
    HondaCity: () => HondaCity(),
    HondaCivic: () => HondaCivic(),
    HondaAccord: () => HondaAccord(),
  });

  // You can get a variety of informations from the factory.
  print(
      'Builders: ${hondaFactory.keys}'); // (HondaCity, HondaCivic, HondaAccord)
  print('Builder Count: ${hondaFactory.length}'); // 3
  print('isEmpty: ${hondaFactory.isEmpty}'); // false
  print('isNotEmpty: ${hondaFactory.isNotEmpty}'); // true
  print('contains HondaCivic: ${hondaFactory.contains(HondaCivic)}'); // true
  print(
      'doesNotContain HondaCivic: ${hondaFactory.doesNotContain(HondaCivic)}'); // false

  // You can create an instance by calling createInstance with a key.
  print('- Creating Honda Accord.');
  final accord = hondaFactory.createInstance(HondaAccord);
  accord.startEngine(); // HondaAccord: Engine Started

  // Or you can get the builder and run it to get the instance.
  print('- Creating Honda Accord manually.');
  final accordBuilder = hondaFactory.getBuilder(HondaAccord);
  final accord2 = accordBuilder();
  accord2.startEngine(); // HondaAccord: Engine Started

  // Unregistered builders when called throws error.
  print('- Creating HondaJazz.');
  try {
    final jazz = hondaFactory
        .createInstance(HondaJazz); // throws BuilderNotFoundInFactoryException
    jazz.startEngine();
  } catch (exception) {
    // prints the following:
    //
    // BuilderNotFoundInFactoryException has occured.
    // > Problem: No builder found in the factory for key - HondaJazz.
    // > Solution: Please insert a builder in to the factory with key - HondaJazz.
    print(exception);
  }

  //
  // ModifiableFactory
  //
  print('\nModifiableHondaFactory:\n');
  print('- Creating ModifiableHondaFactory.');
  final modifiableHondaFactory = ModifiableHondaFactory({
    HondaJazz: () => HondaJazz(),
    HondaCrv: () => HondaCrv(),
  });
  print('Builders: ${modifiableHondaFactory.keys}'); // (HondaJazz, HondaCrv)

  // Overwrites any existing builder.
  print('- Registering HondaCity');
  modifiableHondaFactory.registerBuilder(HondaCity, () => HondaCity());
  print(
      'Builders: ${modifiableHondaFactory.keys}'); // (HondaJazz, HondaCrv, HondaCity)

  print('- Registering a list - [HondaCivic, HondaAccord].');
  modifiableHondaFactory.registerBuilders({
    HondaCivic: () => HondaCivic(),
    HondaAccord: () => HondaAccord(),
  });
  print(
      'Builders: ${modifiableHondaFactory.keys}'); // (HondaJazz, HondaCrv, HondaCity, HondaCivic, HondaAccord)

  print('- Unregistering a builder - HondaJazz.');
  modifiableHondaFactory.unregisterBuilder(HondaJazz);
  print(
      'Builders: ${modifiableHondaFactory.keys}'); // (HondaCrv, HondaCity, HondaCivic, HondaAccord)

  print('- Unregistering a list - [HondaCity, HondaAccord].');
  modifiableHondaFactory.unregisterBuilders([HondaCity, HondaAccord]);
  print('Builders: ${modifiableHondaFactory.keys}'); // (HondaCrv, HondaCivic)

  print('- Copy builders from hondaFactory');
  modifiableHondaFactory.copyBuildersFrom(hondaFactory);
  print(
      'Builders: ${modifiableHondaFactory.keys}'); // (HondaCrv, HondaCivic, HondaCity, HondaAccord)

  print('- Clearing all builders.');
  modifiableHondaFactory.clear();
  print('Builders: ${modifiableHondaFactory.keys}'); // ()

  print('- Merge modifiableHondaFactory with hondaFactory');
  modifiableHondaFactory.mergeWith(hondaFactory);
  print(
      'Builders: ${modifiableHondaFactory.keys}'); // (HondaCity, HondaCivic, HondaAccord)
}
