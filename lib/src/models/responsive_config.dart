import 'dart:ui';

import 'package:widget_responsive/src/models/screen_sizes.dart';

enum RSizes {
  xlarge,
  large,
  medium,
  small,
  xsmall,
}

class ResponsiveConfiguration {
  ResponsiveConfiguration._({
    required Size screenSize,
    required ScreenSizes sizes,
  })  : _currentScreenSize = screenSize,
        _sizes = sizes;
  static late final ResponsiveConfiguration instance;

  Size _currentScreenSize;
  late final ScreenSizes _sizes;

  Size get screenSize => _currentScreenSize;
  ScreenSizes get sizes => _sizes;

  static init({
    required Size screenSize,
    required ScreenSizes sizes,
  }) {
    instance = ResponsiveConfiguration._(
      screenSize: screenSize,
      sizes: sizes,
    );
  }

  void updateScreenSize(Size screenSize) {
    _currentScreenSize = screenSize;
  }

  int adaptiveValue(
    int value,
    Map<RSizes, int> values,
  ) {
    int v = value;
    final adaptSize = values.entries.firstWhere((element) {
      final size = _sizes.sizes.firstWhere(
        (s) =>
            _currentScreenSize.width >= s.width &&
            _currentScreenSize.height >= s.height,
      );
      final index = _sizes.sizes.indexOf(size);
      return RSizes.values[index] == element.key;
    });
    return adaptSize.value;
  }

  @override
  String toString() => 'current screen size : $screenSize,different screens supported : ${sizes.toString()}';
}
