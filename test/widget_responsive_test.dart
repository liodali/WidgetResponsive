import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:widget_responsive/src/models/responsive_config.dart';

import 'package:widget_responsive/widget_responsive.dart';

void main() {
  test('test adaptive size', () {
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
}
