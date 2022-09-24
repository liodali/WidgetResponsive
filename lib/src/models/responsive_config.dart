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
    Size? currentSize,
    required ScreenSizes sizes,
  }) : _sizes = sizes {
    if (currentSize != null) {
      _currentScreenSize = currentSize;
    }
  }
  static late final ResponsiveConfiguration instance;

  late Size _currentScreenSize;
  late final ScreenSizes _sizes;

  Size get screenSize => _currentScreenSize;
  ScreenSizes get sizes => _sizes;

  static init({
    Size? screenSize,
    required ScreenSizes sizes,
  }) {
    instance = ResponsiveConfiguration._(
      currentSize: screenSize,
      sizes: sizes,
    );
  }

  void updateScreenSize(Size screenSize) {
    _currentScreenSize = screenSize;
  }

  double adaptiveValue(
    double value,
    Map<RSizes, double> values,
  ) {
    double v = value;
    final adaptSize = values.entries.firstWhere(
      (element) {
        final size = _sizes.sizes.firstWhere(
            (s) =>
                _currentScreenSize.width >= s.width &&
                _currentScreenSize.height >= s.height,
            orElse: () => _sizes.sizes.last);
        final index = _sizes.sizes.indexOf(size);
        return RSizes.values[index] == element.key;
      },
    );
    return adaptSize.value;
  }

  @override
  String toString() =>
      'current screen size : $screenSize \n different screens supported : ${sizes.toString()}';
}
