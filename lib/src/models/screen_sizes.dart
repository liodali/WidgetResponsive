import 'package:flutter/widgets.dart';

class ScreenSizes {
  final Size xsmall;
  final Size small;
  final Size medium;
  final Size large;
  final Size xlarge;

  const ScreenSizes({
    required this.xsmall,
    required this.small,
    required this.medium,
    required this.large,
    required this.xlarge,
  });

  List<Size> get sizes => [
        xlarge,
        large,
        medium,
        small,
        xsmall,
      ];

  @override
  String toString() =>
      'xl:$xlarge,l:$large,m:$medium,s:$small,xs:$xsmall';
}
