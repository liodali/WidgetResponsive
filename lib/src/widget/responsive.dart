import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:widget_responsive/src/models/responsive_config.dart';
import 'package:widget_responsive/src/screen_responsive.dart';

typedef ResponsiveBuilder = Widget Function(BuildContext ctx, Widget?);

/// Responsive
///
/// Widget that will make sure the child will be update to the different sizes of the screen
class Responsive extends StatefulWidget {
  final Widget? child;
  final ResponsiveBuilder xlarge;
  final ResponsiveBuilder large;
  final ResponsiveBuilder medium;
  final ResponsiveBuilder small;
  final ResponsiveBuilder xSmall;
  const Responsive({
    super.key,
    this.child,
    required this.xlarge,
    required this.large,
    required this.medium,
    required this.small,
    required this.xSmall,
  });

  @override
  State<Responsive> createState() => ResponsiveState();
}

class ResponsiveState extends State<Responsive> {
  late ResponsiveConfiguration configuration;
  @override
  void initState() {
    super.initState();
    configuration = ScreenResponsive.of(context)!;
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (ctx, constraints) {
      return widget.xSmall(ctx, widget.child);
    });
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    properties.add(StringProperty(
      'screen size',
      configuration.screenSize.toString(),
    ));
    properties.add(StringProperty(
      'xlarge screen size',
      configuration.sizes.xlarge.toString(),
    ));
    properties.add(StringProperty(
      'large screen size',
      configuration.sizes.large.toString(),
    ));
    properties.add(StringProperty(
      'medium screen size',
      configuration.sizes.medium.toString(),
    ));
    properties.add(StringProperty(
      'small screen size',
      configuration.sizes.small.toString(),
    ));
    properties.add(StringProperty(
      'xsmall screen size',
      configuration.sizes.xsmall.toString(),
    ));

    super.debugFillProperties(properties);
  }
}
