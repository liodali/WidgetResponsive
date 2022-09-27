import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:widget_responsive/src/models/responsive_config.dart';
import 'package:widget_responsive/src/models/responsive_size.dart';
import 'package:widget_responsive/src/screen_responsive.dart';
import 'package:widget_responsive/src/utilities/extension.dart';

/// Responsive
///
/// Widget that will make sure the child will be update to the different sizes of the screen
class ResponsivePositionned extends StatefulWidget {
  final Widget child;
  final RSize? top;
  final RSize? bottom;
  final RSize? right;
  final RSize? left;
  final RSize? height;
  final RSize? width;
  const ResponsivePositionned({
    super.key,
    required this.child,
    this.top,
    this.bottom,
    this.right,
    this.left,
    this.height,
    this.width,
  })  : assert(top == null || bottom == null || height == null),
        assert(left == null || right == null || width == null );

  @override
  State<ResponsivePositionned> createState() => ResponsiveState();
}

class ResponsiveState extends State<ResponsivePositionned>
    with WidgetsBindingObserver {
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
    });
  }

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: widget.top != null
          ? custom(
              xlarge: widget.top!.xlarge,
              large: widget.top!.large,
              medium: widget.top!.medium,
              small: widget.top!.small,
              xsmall: widget.top!.xsmall,
            )
          : null,
      left: widget.left != null
          ? custom(
              xlarge: widget.left!.xlarge,
              large: widget.left!.large,
              medium: widget.left!.medium,
              small: widget.left!.small,
              xsmall: widget.left!.xsmall,
            )
          : null,
      right: widget.right != null
          ? custom(
              xlarge: widget.right!.xlarge,
              large: widget.right!.large,
              medium: widget.right!.medium,
              small: widget.right!.small,
              xsmall: widget.right!.xsmall,
            )
          : null,
      bottom: widget.bottom != null
          ? custom(
              xlarge: widget.bottom!.xlarge,
              large: widget.bottom!.large,
              medium: widget.bottom!.medium,
              small: widget.bottom!.small,
              xsmall: widget.bottom!.xsmall,
            )
          : null,
      width: widget.width != null
          ? custom(
              xlarge: widget.width!.xlarge,
              large: widget.width!.large,
              medium: widget.width!.medium,
              small: widget.width!.small,
              xsmall: widget.width!.xsmall,
            )
          : null,
      height: widget.height != null
          ? custom(
              xlarge: widget.height!.xlarge,
              large: widget.height!.large,
              medium: widget.height!.medium,
              small: widget.height!.small,
              xsmall: widget.height!.xsmall,
            )
          : null,
      child: widget.child,
    );
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    properties.add(StringProperty(
      'screen size',
      configuration.screenSize.toString(),
    ));
    properties.add(StringProperty(
      'top',
      (widget.top ?? 0.0).toString(),
    ));
    properties.add(StringProperty(
      'bottom',
      (widget.bottom ?? 0.0).toString(),
    ));
    properties.add(StringProperty(
      'left',
      (widget.left ?? 0.0).toString(),
    ));
    properties.add(StringProperty(
      'right',
      (widget.right ?? 0.0).toString(),
    ));
    properties.add(StringProperty(
      'width',
      (widget.width ?? 0.0).toString(),
    ));
    properties.add(StringProperty(
      'height',
      (widget.height ?? 0.0).toString(),
    ));

    super.debugFillProperties(properties);
  }
}
