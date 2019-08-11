part of catalog.widgets;

class ColoredRadio<T> extends StatefulWidget {
  const ColoredRadio({
    Key key,
    @required this.value,
    @required this.groupValue,
    @required this.onChanged,
    this.activeColor,
    this.borderColor,
    this.materialTapTargetSize,
    this.radius = 8.0,
  }) : super(key: key);

  final T value;
  final T groupValue;
  final ValueChanged<T> onChanged;
  final Color activeColor;
  final Color borderColor;
  final double radius;

  final MaterialTapTargetSize materialTapTargetSize;

  @override
  _RadioState<T> createState() => _RadioState<T>();
}

class _RadioState<T> extends State<ColoredRadio<T>>
    with TickerProviderStateMixin {
  bool get _enabled => widget.onChanged != null;

  Color _getInactiveColor(ThemeData themeData) {
    return _enabled ? themeData.unselectedWidgetColor : themeData.disabledColor;
  }

  void _handleChanged(bool selected) {
    if (selected) widget.onChanged(widget.value);
  }

  @override
  Widget build(BuildContext context) {
    assert(debugCheckHasMaterial(context));
    final themeData = Theme.of(context);
    Size size;
    switch (widget.materialTapTargetSize ?? themeData.materialTapTargetSize) {
      case MaterialTapTargetSize.padded:
        size = const Size(
            2 * kRadialReactionRadius + 8.0, 2 * kRadialReactionRadius + 8.0);
        break;
      case MaterialTapTargetSize.shrinkWrap:
        size = const Size(2 * kRadialReactionRadius, 2 * kRadialReactionRadius);
        break;
    }
    final additionalConstraints = BoxConstraints.tight(size);
    return _RadioRenderObjectWidget(
      selected: widget.value == widget.groupValue,
      activeColor: widget.activeColor ?? themeData.toggleableActiveColor,
      borderColor: widget.borderColor,
      inactiveColor: _getInactiveColor(themeData),
      onChanged: _enabled ? _handleChanged : null,
      additionalConstraints: additionalConstraints,
      radius: widget.radius,
      vsync: this,
    );
  }
}

class _RadioRenderObjectWidget extends LeafRenderObjectWidget {
  const _RadioRenderObjectWidget({
    Key key,
    @required this.selected,
    @required this.activeColor,
    @required this.inactiveColor,
    @required this.additionalConstraints,
    this.radius = 8.0,
    this.borderColor,
    this.onChanged,
    @required this.vsync,
  })  : assert(selected != null),
        assert(activeColor != null),
        assert(inactiveColor != null),
        assert(vsync != null),
        super(key: key);

  final bool selected;
  final double radius;
  final Color inactiveColor;
  final Color activeColor;
  final Color borderColor;
  final ValueChanged<bool> onChanged;
  final TickerProvider vsync;
  final BoxConstraints additionalConstraints;

  @override
  _RenderRadio createRenderObject(BuildContext context) => _RenderRadio(
        value: selected,
        activeColor: activeColor,
        borderColor: borderColor,
        inactiveColor: inactiveColor,
        onChanged: onChanged,
        vsync: vsync,
        additionalConstraints: additionalConstraints,
        radius: radius,
      );

  @override
  void updateRenderObject(BuildContext context, _RenderRadio renderObject) {
    renderObject
      ..value = selected
      ..activeColor = activeColor
      ..inactiveColor = inactiveColor
      ..borderColor = borderColor
      ..onChanged = onChanged
      ..additionalConstraints = additionalConstraints
      ..radius = radius
      ..vsync = vsync;
  }
}

class _RenderRadio extends RenderToggleable {
  Color borderColor;
  double radius;
  _RenderRadio({
    bool value,
    Color activeColor,
    Color inactiveColor,
    this.borderColor,
    ValueChanged<bool> onChanged,
    BoxConstraints additionalConstraints,
    this.radius = 8.0,
    @required TickerProvider vsync,
  }) : super(
          value: value,
          tristate: false,
          activeColor: activeColor,
          inactiveColor: inactiveColor,
          onChanged: onChanged,
          additionalConstraints: additionalConstraints,
          vsync: vsync,
        );

  @override
  void paint(PaintingContext context, Offset offset) {
    final canvas = context.canvas;

    paintRadialReaction(canvas, offset, size.center(Offset.zero));

    final center = (offset & size).center;
    final radioColor = onChanged != null ? activeColor : inactiveColor;

    var paint = Paint();
    if (borderColor != null) {
      paint = Paint()
        ..color = borderColor
        ..style = PaintingStyle.stroke
        ..strokeWidth = 1.0;
    } else {
      paint = Paint()
        ..color = Color.lerp(inactiveColor, radioColor, position.value)
        ..style = PaintingStyle.fill;
    }

    canvas.drawCircle(
      center,
      !position.isDismissed ? radius + 5 : radius,
      paint,
    );
  }

  @override
  void describeSemanticsConfiguration(SemanticsConfiguration config) {
    super.describeSemanticsConfiguration(config);
    config
      ..isInMutuallyExclusiveGroup = true
      ..isChecked = value == true;
  }
}
