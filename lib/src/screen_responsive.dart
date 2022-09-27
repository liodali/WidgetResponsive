import 'package:flutter/material.dart';
import 'package:widget_responsive/src/models/responsive_config.dart';
import 'package:widget_responsive/src/models/screen_sizes.dart';

/// Responsive
///
/// Widget that will make sure the child will be update to the different sizes of the screen
///
/// this widget should be as parent for all application
///
/// set [sizes] will help [child] in [Responsive] to change depend on the screen size
class ScreenResponsive extends StatefulWidget {
  const ScreenResponsive({
    super.key,
    required this.child,
    required this.sizes,
  });

  // this child should be you application
  final Widget child;

  // sizes used to be used in [Responsive] Widget to adapt it self with different screen sizes
  final ScreenSizes sizes;

  @override
  State<ScreenResponsive> createState() => ScreenResponsiveState();

  static ResponsiveConfiguration? of(BuildContext context,
      {bool nullOk = false}) {
    final ScreenResponsiveState? result =
        context.findRootAncestorStateOfType<ScreenResponsiveState>();
    if (nullOk || result != null) return result?.configuration;
    throw FlutterError.fromParts(<DiagnosticsNode>[
      ErrorSummary(
          'ScreenResponsive.of() called with a context that does not contain an ScreenSizes.'),
      ErrorDescription(
          'No ScreenResponsive ancestor could be found starting from the context that was passed to ScreenResponsive.of().'),
      context.describeElement('The context used was')
    ]);
  }
}

class ScreenResponsiveState extends State<ScreenResponsive> {
  late List<Size> sizes;

  late final ResponsiveConfiguration configuration;
  @override
  void initState() {
    super.initState();
    ResponsiveConfiguration.init(
      sizes: widget.sizes,
    );
    configuration = ResponsiveConfiguration.instance;
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    configuration.updateScreenSize(
      MediaQuery.of(context).size,
    );
  }

  @override
  Widget build(BuildContext context) {
    return widget.child;
  }
}
