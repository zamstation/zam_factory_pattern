library factory;

import 'package:zam_core/meta.dart';
import 'package:zam_core/zam_core.dart' show Builder;
import 'builder_not_found_in_factory.exception.dart';

part 'modifiable_factory_mixin.dart';

class Factory<KEY extends Object, INSTANCE extends Object> {
  final Map<KEY, Builder<INSTANCE>> _builders;

  Iterable<KEY> get keys => _builders.keys;
  int get length => _builders.length;
  bool get isEmpty => _builders.isEmpty;
  bool get isNotEmpty => builders.isNotEmpty;
  Map<KEY, Builder<INSTANCE>> get builders => Map.unmodifiable(_builders);

  const Factory(Map<KEY, Builder<INSTANCE>> builders) : _builders = builders;

  bool contains(KEY key) {
    return builders.containsKey(key);
  }

  bool doesNotContain(KEY key) {
    return !contains(key);
  }

  Builder<INSTANCE> getBuilder(KEY key) {
    if (doesNotContain(key)) throw buildException(key);
    final builder = builders[key];
    return builder!;
  }

  INSTANCE createInstance(KEY key, [Object? request]) {
    final builder = getBuilder(key);
    final instance = builder();
    return instance;
  }

  @protected
  BuilderNotFoundInFactoryException buildException(KEY key) {
    return BuilderNotFoundInFactoryException(key.toString());
  }
}
