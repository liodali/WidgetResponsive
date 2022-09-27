import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:widget_responsive/src/models/responsive_config.dart';

import 'package:widget_responsive/widget_responsive.dart';

void main() {
  group('responsive 1', () {
    ResponsiveConfiguration.init(
      screenSize: const Size(400, 800),
      sizes: const ScreenSizes(
        xsmall: Size(240, 320),
        small: Size(320, 480),
        medium: Size(460, 640),
        large: Size(570, 720),
        xlarge: Size(620, 880),
      ),
    );
    test('test adaptive size case 1', () {
      final responsive = ResponsiveConfiguration.instance;
      double result = responsive.adaptiveValue(20, {
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
      double result = responsive.adaptiveValue(20, {
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
      double result = responsive.adaptiveValue(20, {
        RSizes.large: 25,
        RSizes.medium: 20,
        RSizes.small: 12,
        RSizes.xsmall: 6,
      });
      expect(result, 20);
    });
  });
  group('responsive 2', () {
    ResponsiveConfiguration.init(
      screenSize: const Size(728, 871),
      sizes: const ScreenSizes(
        xlarge: Size(720, 1024),
        large: Size(680, 960),
        medium: Size(520, 844),
        small: Size(400, 650),
        xsmall: Size(320, 480),
      ),
    );
    test('test adaptive size case 1', () {
      final responsive = ResponsiveConfiguration.instance;
      double result = responsive.adaptiveValue(20, {
        RSizes.large: 25,
        RSizes.medium: 20,
        RSizes.small: 12,
        RSizes.xsmall: 6,
      });
      expect(result, 25);
    }); 
  });
}
