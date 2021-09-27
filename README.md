# Factory Pattern

Provides utilities to implement the factory pattern which deals with the problem of creating objects.

## What's inside the package

Includes the following core components.

- [Factory](https://pub.dev/documentation/zam_factory_pattern/latest/zam_factory_pattern/Factory-class.html)
- [ModifiableFactory](https://pub.dev/documentation/zam_factory_pattern/latest/zam_factory_pattern/ModifiableFactory-class.html)
- [TypedFactory](https://pub.dev/documentation/zam_factory_pattern/latest/zam_factory_pattern/TypedFactory-class.html)

Check out all the components in detail [here](https://pub.dev/documentation/zam_factory_pattern/latest/zam_factory_pattern/zam_factory_pattern-library.html)

## How to use

```dart
final hondaFactory = HondaFactory({
  HondaCity: () => HondaCity(),
  HondaCivic: () => HondaCivic(),
  HondaAccord: () => HondaAccord(),
});
```

To learn more, move on to the [example section](https://pub.dev/packages/zam_factory_pattern/example) or check out these dedicated [examples in github](https://github.com/zamstation/zam_factory_pattern/blob/main/example/lib).

## Status
[![Build](https://github.com/zamstation/zam_factory_pattern/actions/workflows/build_workflow.yaml/badge.svg)](https://github.com/zamstation/zam_factory_pattern/actions/workflows/build_workflow.yaml)

## Contributors
- [Amsakanna](https://github.com/amsakanna)

## License
[BSD 3-Clause License](https://github.com/zamstation/zam_factory_pattern/blob/main/LICENSE)
