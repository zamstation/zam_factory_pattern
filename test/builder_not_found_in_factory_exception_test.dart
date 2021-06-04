import 'package:zam_core/zam_core.dart';
import 'package:zam_factory_pattern/exceptions.dart';
import 'package:zam_test/zam_test.dart';

void main() {
  TestGroup('BuilderNotFoundInFactoryException', [
    ProblemTest(),
    SolutionTest(),
    SeverityTest(),
  ]).execute();
}

class ProblemTest extends Test<String, String> {
  @override
  run(input) {
    final exception = BuilderNotFoundInFactoryException(input);
    return exception.problem;
  }

  @override
  get cases => [
        ValueTestCase(
          when: 'When the exception is constructed',
          then: 'problem statement should be as specified.',
          input: 'HondaAccord',
          output: 'No builder found in the factory for key - HondaAccord.',
        ),
      ];
}

class SolutionTest extends Test<String, String> {
  @override
  run(input) {
    final exception = BuilderNotFoundInFactoryException(input);
    return exception.solution;
  }

  @override
  get cases => [
        ValueTestCase(
          when: 'When the exception is constructed',
          then: 'solution statement should be as specified.',
          input: 'HondaAccord',
          output:
              'Please insert a builder in to the factory with key - HondaAccord.',
        ),
      ];
}

class SeverityTest extends Test<String, ExceptionSeverity> {
  @override
  String get name => runtimeType.toString();

  @override
  run(input) {
    final exception = BuilderNotFoundInFactoryException(input);
    return exception.severity;
  }

  @override
  get cases => [
        ValueTestCase(
          when: 'When the exception is constructed',
          then: 'severity should be critical.',
          input: 'HondaAccord',
          output: ExceptionSeverity.critical,
        ),
      ];
}
