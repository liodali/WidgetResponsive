import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:widget_responsive/src/models/responsive_config.dart';

import 'package:widget_responsive/widget_responsive.dart';

void main() {
  ResponsiveConfiguration.init(
    screenSize: const Size(400, 800),
    sizes: ScreenSizes(
      xsmall: const Size(240, 320),
      small: const Size(320, 480),
      medium: const Size(460, 640),
      large: const Size(570, 720),
      xlarge: const Size(620, 880),
    ),
  );
  test('test adaptive size case 1', () {
    final responsive = ResponsiveConfiguration.instance;
    int result = responsive.adaptiveValue(20, {
      RSizes.large: 25,
      RSizes.medium: 20,
      RSizes.small: 12,
      RSizes.xsmall: 6,
    });
    expect(result, 12);
    expect(result != 20, true);
  });
  test('test adaptive size case 2', () {
    final responsive = ResponsiveConfiguration.instance;
    responsive.updateScreenSize(const Size(580, 820));
    int result = responsive.adaptiveValue(20, {
      RSizes.large: 25,
      RSizes.medium: 20,
      RSizes.small: 12,
      RSizes.xsmall: 6,
    });
    expect(result, 25);
  });
  test('test adaptive size case 3', () {
    
    final responsive = ResponsiveConfiguration.instance;
    responsive.updateScreenSize(const Size(460, 720));
    int result = responsive.adaptiveValue(20, {
      RSizes.large: 25,
      RSizes.medium: 20,
      RSizes.small: 12,
      RSizes.xsmall: 6,
    });
    expect(result, 20);
  });
}
