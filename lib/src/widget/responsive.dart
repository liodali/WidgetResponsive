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
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangeMetrics() {
    super.didChangeMetrics();
    setState(() {
      configuration.updateScreenSize(MediaQuery.of(context).size);
      void rebuild(Element el) {
        el.markNeedsBuild();
        el.visitChildren(rebuild);
      }

      (context as Element).visitChildren(rebuild);
    });
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return widget.child;
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
