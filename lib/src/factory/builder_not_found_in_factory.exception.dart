import 'package:zam_core/zam_core.dart';

class BuilderNotFoundInFactoryException extends NamedException {
  final String builderKey;

  const BuilderNotFoundInFactoryException(this.builderKey)
      : super(
          'No builder found in the factory for key - $builderKey.',
          solution:
              'Please insert a builder in to the factory with key - $builderKey.',
          severity: ExceptionSeverity.critical,
        );
}
