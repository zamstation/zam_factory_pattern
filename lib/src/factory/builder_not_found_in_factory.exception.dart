import 'package:zam_core/zam_core.dart';

class BuilderNotFoundInFactoryException extends NamedException {
  final String builderKey;

  String get problem =>
      'No builder found in the factory for key - $builderKey.';
  String get solution =>
      'Please insert a builder in to the factory with key - $builderKey.';
  ExceptionSeverity get severity => ExceptionSeverity.critical;

  const BuilderNotFoundInFactoryException(this.builderKey);
}
