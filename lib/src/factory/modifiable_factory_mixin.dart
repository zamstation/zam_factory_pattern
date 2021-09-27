part of 'factory.dart';

///
/// A mixin that makes a [Factory] into a [ModifiableFactory]
/// where builders can be added and removed at any time.
///
mixin ModifiableFactoryMixin<KEY extends Object, INSTANCE extends Object>
    on Factory<KEY, INSTANCE> {
  Factory<KEY, INSTANCE> registerBuilder(KEY key, Builder<INSTANCE> builder) {
    _builders.addEntries([MapEntry(key, builder)]);
    return this;
  }

  Factory<KEY, INSTANCE> registerBuilders(
      Map<KEY, Builder<INSTANCE>> builders) {
    builders.forEach(registerBuilder);
    return this;
  }

  Factory<KEY, INSTANCE> copyBuildersFrom(Factory<KEY, INSTANCE> factory) {
    registerBuilders(factory._builders);
    return this;
  }

  Factory<KEY, INSTANCE> mergeWith(Factory<KEY, INSTANCE> factory) {
    return copyBuildersFrom(factory);
  }

  Factory<KEY, INSTANCE> unregisterBuilder(KEY key) {
    _builders.remove(key);
    return this;
  }

  Factory<KEY, INSTANCE> unregisterBuilders(Iterable<KEY> keys) {
    keys.forEach(unregisterBuilder);
    return this;
  }

  Factory<KEY, INSTANCE> clear() {
    unregisterBuilders(_builders.keys.toList());
    return this;
  }
}
