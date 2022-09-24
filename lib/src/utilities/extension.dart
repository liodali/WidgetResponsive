import 'package:widget_responsive/src/models/responsive_config.dart';

extension ResponsiveDimension on double {
  double xL({
    required double large,
    required double medium,
    required double small,
    required double xsmall,
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

  double L({
    required double xlarge,
    required double medium,
    required double small,
    required double xsmall,
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

  double M({
    required double xlarge,
    required double large,
    required double small,
    required double xsmall,
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

  double S({
    required double xlarge,
    required double large,
    required double medium,
    required double xsmall,
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

  double xS({
    required double xlarge,
    required double large,
    required double medium,
    required double small,
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

double custom({
  required double xlarge,
  required double large,
  required double medium,
  required double small,
  required double xsmall,
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
