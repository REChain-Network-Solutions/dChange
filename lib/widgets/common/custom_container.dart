// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';

class CustomContainer extends StatefulWidget {
  const CustomContainer({
    super.key,
    this.child,
    this.onTap,
    this.height,
    this.width,
    this.margin = 0,
    this.customMargin,
    this.shadowColor,
    this.color,
    this.onHighlightChanged,
    this.onDoubleTap,
    this.onLongPress,
    this.onTapDown,
    this.onTapCancel,
    this.onHover,
    this.mouseCursor,
    this.focusColor,
    this.hoverColor,
    this.highlightColor,
    this.overlayColor,
    this.splashColor,
    this.splashFactory,
    this.inkSplashRadius,
    this.customBorder,
    this.focusNode,
    this.onFocusChange,
    this.alignmentWidthFactor,
    this.alignmentHeightFactor,
    this.alignment = Alignment.center,
    this.borderOnForeground = true,
    this.semanticContainer = true,
    this.canRequestFocus = true,
    this.autofocus = false,
    this.enableFeedback = true,
    this.excludeFromSemantics = false,
    this.allowOverflow = false,
    this.borderRadius = 5,
    this.customBorderRadius,
    this.elevation = 0,
    this.padding = 0,
    this.customPadding,
    this.zeroDownElevationOnTap = true,
    this.showBorder = false,
    this.borderWidth = 1,
    this.borderColor = Colors.black,
    this.borderStyle = BorderStyle.solid,
  });

  final VoidCallback? onTap;

  final Widget? child;

  final double padding;

  final EdgeInsets? customPadding;

  final double? height;

  final double? width;

  final double borderWidth;

  final double margin;

  final EdgeInsets? customMargin;

  final Color borderColor;

  final BorderStyle borderStyle;

  final Color? color;

  final double borderRadius;

  final BorderRadius? customBorderRadius;

  final Color? shadowColor;

  final double elevation;

  final bool zeroDownElevationOnTap;

  final bool allowOverflow;

  final void Function(bool)? onHighlightChanged;

  final GestureTapCallback? onDoubleTap;
  final GestureLongPressCallback? onLongPress;
  final GestureTapDownCallback? onTapDown;
  final GestureTapCancelCallback? onTapCancel;
  final ValueChanged<bool>? onHover;
  final MouseCursor? mouseCursor;
  final Color? focusColor;

  final Color? hoverColor;

  final Color? highlightColor;

  final Color? splashColor;

  final MaterialStateProperty<Color?>? overlayColor;

  final InteractiveInkFeatureFactory? splashFactory;

  final double? inkSplashRadius;

  final ShapeBorder? customBorder;

  final bool? enableFeedback;

  final bool excludeFromSemantics;

  final FocusNode? focusNode;

  final bool canRequestFocus;

  final ValueChanged<bool>? onFocusChange;

  final bool autofocus;

  final bool borderOnForeground;

  final bool semanticContainer;

  final AlignmentGeometry? alignment;

  final double? alignmentHeightFactor;

  final double? alignmentWidthFactor;

  final bool showBorder;

  @override
  _CustomContainerState createState() => _CustomContainerState();
}

class _CustomContainerState extends State<CustomContainer> {
  late double _elevation;
  bool _isPressed = false;

  @override
  Widget build(BuildContext context) {
    if (!_isPressed) _elevation = widget.elevation;

    final borderRadius =
        widget.customBorderRadius ?? BorderRadius.circular(widget.borderRadius);

    return SizedBox(
      height: widget.height,
      width: widget.width,
      child: Card(
        borderOnForeground: widget.borderOnForeground,
        semanticContainer: widget.semanticContainer,
        shape: RoundedRectangleBorder(
          side: widget.showBorder
              ? BorderSide(
                  color: widget.borderColor,
                  width: widget.borderWidth,
                  style: widget.borderStyle,
                )
              : BorderSide.none,
          borderRadius: borderRadius,
        ),
        color: widget.color ?? Theme.of(context).cardColor,
        elevation: _elevation,
        margin: widget.customMargin ?? EdgeInsets.all(widget.margin),
        shadowColor:
            widget.shadowColor ?? widget.color ?? Theme.of(context).cardColor,
        clipBehavior: widget.allowOverflow ? null : Clip.hardEdge,
        child: InkWell(
          borderRadius: borderRadius,
          radius: widget.inkSplashRadius,
          onDoubleTap: widget.onDoubleTap,
          onLongPress: widget.onLongPress,
          onTapDown: widget.onTapDown,
          onTapCancel: widget.onTapCancel,
          onHover: widget.onHover,
          mouseCursor: widget.mouseCursor,
          focusColor: widget.focusColor,
          hoverColor: widget.hoverColor,
          highlightColor: widget.highlightColor,
          overlayColor: widget.overlayColor,
          splashColor: widget.splashColor,
          splashFactory: widget.splashFactory,
          customBorder: widget.customBorder,
          focusNode: widget.focusNode,
          onFocusChange: widget.onFocusChange,
          canRequestFocus: widget.canRequestFocus,
          autofocus: widget.autofocus,
          enableFeedback: widget.enableFeedback,
          excludeFromSemantics: widget.excludeFromSemantics,
          onTap: widget.onTap,
          onHighlightChanged: (v) {
            if (widget.zeroDownElevationOnTap) {
              _isPressed = v;
              if (widget.elevation == 0) {
                return;
              } else if (widget.elevation <= 2.5) {
                _elevation = v ? 0 : widget.elevation;
              } else {
                _elevation = v ? 2.5 : widget.elevation;
              }
              setState(() {});
            }
            if (widget.onHighlightChanged != null) {
              return widget.onHighlightChanged!(v);
            }
          },
          child: Padding(
            padding: widget.customPadding ?? EdgeInsets.all(widget.padding),
            child: (widget.alignment == null)
                ? widget.child
                : Align(
                    alignment: widget.alignment!,
                    heightFactor: widget.alignmentHeightFactor,
                    widthFactor: widget.alignmentWidthFactor,
                    child: widget.child,
                  ),
          ),
        ),
      ),
    );
  }
}
