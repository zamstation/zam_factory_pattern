import 'package:zam_core/zam_core.dart';

///
/// Exception that is thrown when a builder is not
/// found in the factory.
///
class BuilderNotFoundInFactoryException extends NamedException {
  final String builderKey;

  @override
  get problem => 'No builder found in the factory for key - $builderKey.';
  @override
  get solution =>
      'Please insert a builder in to the factory with key - $builderKey.';
  @override
  get severity => ExceptionSeverity.critical;

  const BuilderNotFoundInFactoryException(this.builderKey);
}
