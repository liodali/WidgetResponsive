import 'package:widget_responsive/src/models/responsive_config.dart';

extension ResponsiveDimension on int {
  int xL({
    required int large,
    required int medium,
    required int small,
    required int xsmall,
  }) {
    return ResponsiveConfiguration.instance.adaptiveValue(
      this,
      {
        RSizes.xlarge: this,
        RSizes.large: large,
        RSizes.medium: medium,
        RSizes.small: small,
        RSizes.xsmall: xsmall,
      },
    );
  }

  int L({
    required int xlarge,
    required int medium,
    required int small,
    required int xsmall,
  }) {
    return ResponsiveConfiguration.instance.adaptiveValue(
      this,
      {
        RSizes.xlarge: xlarge,
        RSizes.large: this,
        RSizes.medium: medium,
        RSizes.small: small,
        RSizes.xsmall: xsmall,
      },
    );
  }

  int M({
    required int xlarge,
    required int large,
    required int small,
    required int xsmall,
  }) {
    return ResponsiveConfiguration.instance.adaptiveValue(
      this,
      {
        RSizes.xlarge: xlarge,
        RSizes.large: large,
        RSizes.medium: this,
        RSizes.small: small,
        RSizes.xsmall: xsmall,
      },
    );
  }

  int S({
    required int xlarge,
    required int large,
    required int medium,
    required int xsmall,
  }) {
    return ResponsiveConfiguration.instance.adaptiveValue(
      this,
      {
        RSizes.xlarge: xlarge,
        RSizes.large: large,
        RSizes.medium: medium,
        RSizes.small: this,
        RSizes.xsmall: xsmall,
      },
    );
  }

  int xS({
    required int xlarge,
    required int large,
    required int medium,
    required int small,
  }) {
    return ResponsiveConfiguration.instance.adaptiveValue(
      this,
      {
        RSizes.xlarge: xlarge,
        RSizes.large: large,
        RSizes.medium: medium,
        RSizes.small: small,
        RSizes.xsmall: this,
      },
    );
  }
}

int custom({
  required int xlarge,
  required int large,
  required int medium,
  required int small,
  required int xsmall,
}) {
  return ResponsiveConfiguration.instance.adaptiveValue(
    medium,
    {
      RSizes.xlarge: xlarge,
      RSizes.large: large,
      RSizes.medium: medium,
      RSizes.small: small,
      RSizes.xsmall: xsmall,
    },
  );
}
