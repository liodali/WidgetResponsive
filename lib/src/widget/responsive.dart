import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:widget_responsive/src/models/responsive_config.dart';
import 'package:widget_responsive/src/screen_responsive.dart';

/// Responsive
///
/// Widget that will make sure the child will be update to the different sizes of the screen
class Responsive extends StatefulWidget {
  final Widget child;
  const Responsive({
    super.key,
    required this.child,
  });

  @override
  State<Responsive> createState() => ResponsiveState();
}

class ResponsiveState extends State<Responsive> with WidgetsBindingObserver {
  late ResponsiveConfiguration configuration;
  @override
  void initState() {
    super.initState();
    configuration = ScreenResponsive.of(context)!;
  }

  @override
  void didChangeMetrics() {
    super.didChangeMetrics();
    configuration.updateScreenSize(MediaQuery.of(context).size);
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (ctx, constraint) {
      return widget.child;
    });
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    properties.add(StringProperty("configuration", configuration.toString(),));
    super.debugFillProperties(properties);
  }
}
