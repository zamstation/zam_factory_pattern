import 'package:zam_core/zam_core.dart' show Builder;

import '../factory.dart';

class TypedFactory<INSTANCE extends Object> extends Factory<Type, INSTANCE> {
  const TypedFactory(Map<Type, Builder<INSTANCE>> builders) : super(builders);
}
