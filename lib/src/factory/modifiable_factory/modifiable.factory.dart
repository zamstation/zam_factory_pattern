import 'package:zam_core/zam_core.dart' show Builder;

import '../factory.dart';

class ModifiableFactory<KEY extends Object, INSTANCE extends Object>
    extends Factory<KEY, INSTANCE> with ModifiableFactoryMixin {
  const ModifiableFactory(Map<KEY, Builder<INSTANCE>> builders)
      : super(builders);
}
