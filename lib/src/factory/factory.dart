library factory;

import 'package:zam_core/meta.dart';
import 'package:zam_core/zam_core.dart' show Builder;
import 'builder_not_found_in_factory.exception.dart';

part 'modifiable_factory_mixin.dart';

///
/// A [Factory] constains a list of [builders] mapped to
/// their respective [keys].
///
class Factory<KEY extends Object, INSTANCE extends Object> {
  final Map<KEY, Builder<INSTANCE>> _builders;

  ///
  /// Iterable of keys.
  ///
  Iterable<KEY> get keys => _builders.keys;

  ///
  /// Unmodifiable list of builders.
  ///
  Map<KEY, Builder<INSTANCE>> get builders => Map.unmodifiable(_builders);

  ///
  /// Number of builders in the factory.
  ///
  int get length => _builders.length;

  ///
  /// Checks if the factory is empty.
  ///
  bool get isEmpty => _builders.isEmpty;

  ///
  /// Checks if the factory is not empty.
  ///
  bool get isNotEmpty => builders.isNotEmpty;

  ///
  /// Construct using map of builders and their keys.
  ///
  const Factory(Map<KEY, Builder<INSTANCE>> builders) : _builders = builders;

  ///
  /// Checks if a builder is present in the factory.
  ///
  bool contains(KEY key) {
    return builders.containsKey(key);
  }

  ///
  /// Checks if a builder is absent in the factory.
  ///
  bool doesNotContain(KEY key) {
    return !contains(key);
  }

  ///
  /// Returns a builder, when a key is provided.
  ///
  /// Throws [BuilderNotFoundInFactoryException],
  /// when the builder is not found in the factory.
  ///
  Builder<INSTANCE> getBuilder(KEY key) {
    if (doesNotContain(key)) throw buildException(key);
    final builder = builders[key];
    return builder!;
  }

  ///
  /// Finds and runs the builder to create an instance.
  ///
  /// Throws [BuilderNotFoundInFactoryException],
  /// when the builder is not found in the factory.
  ///
  INSTANCE createInstance(KEY key, [Object? request]) {
    final builder = getBuilder(key);
    final instance = builder();
    return instance;
  }

  ///
  /// Used by subclasses to override exception.
  ///
  @protected
  BuilderNotFoundInFactoryException buildException(KEY key) {
    return BuilderNotFoundInFactoryException(key.toString());
  }
}
