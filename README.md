# Zam Factory Pattern Library

Provides utilities to implement the factory pattern which deals with the problem of creating objects.  
  
[![Version](https://img.shields.io/pub/v/zam_factory_pattern?color=%234287f5)](https://pub.dev/packages/zam_factory_pattern)
[![Build](https://github.com/zamstation/zam_factory_pattern/actions/workflows/build.yml/badge.svg)](https://github.com/zamstation/zam_factory_pattern/actions/workflows/build.yml)
[![Stars](https://img.shields.io/github/stars/zamstation/zam_factory_pattern.svg?style=flat&logo=github&colorB=deeppink&label=stars)](https://github.com/zamstation/zam_factory_pattern/stargazers)
[![License](https://img.shields.io/github/license/zamstation/zam_factory_pattern)](https://pub.dev/packages/zam_factory_pattern/license)

## What's inside the package

Includes the following core components.

  * [Factory](https://pub.dev/documentation/zam_factory_pattern/latest/zam_factory_pattern/Factory-class.html)
  * [ModifiedFactory](https://pub.dev/documentation/zam_factory_pattern/latest/zam_factory_pattern/ModifiedFactory-class.html)
  * [TypedFactory](https://pub.dev/documentation/zam_factory_pattern/latest/zam_factory_pattern/TypedFactory-class.html)

Check out all the components in detail [here](https://pub.dev/documentation/zam_factory_pattern/latest/zam_factory_pattern/zam_factory_pattern-library.html)

## How to use

```dart
final hondaFactory = HondaFactory({
  HondaCity: () => HondaCity(),
  HondaCivic: () => HondaCivic(),
  HondaAccord: () => HondaAccord(),
});
```

To learn more, move on to the [example section](https://pub.dev/packages/zam_factory_pattern/example) or check out this dedicated [example in github](https://github.com/zamstation/zam_factory_pattern/blob/main/example/lib/main.dart).

## Contributors
  * [Amsakanna](https://github.com/amsakanna)
