part of controls;

class ColorChooser extends StatefulWidget {
  final List<ProductColor> colors;
  final ValueChanged<String> onSelect;
  final int selectedIndex;
  final double radius;
  ColorChooser({
    this.colors = const [],
    this.onSelect,
    this.selectedIndex = 0,
    this.radius = 8,
  }) : assert(selectedIndex != null);
  @override
  _ColorChooserState createState() => _ColorChooserState();
}

class _ColorChooserState extends State<ColorChooser> {
  String _groupValue;

  @override
  initState() {
    _groupValue = widget.colors[widget.selectedIndex].value;

    super.initState();
  }

  Widget build(BuildContext context) {
    return _buildColors();
  }

  Widget _buildColors() {
    final theme = Theme.of(context);
    return Wrap(
      // mainAxisSize: MainAxisSize.min,
      children: List.generate(widget.colors.length, (index) {
        final color = widget.colors[index];
        return Theme(
          data: theme.copyWith(
            disabledColor: Colors.pink,
            unselectedWidgetColor: color.color,
            toggleableActiveColor: Colors.yellow,
          ),
          child: Container(
            constraints: BoxConstraints.tight(Size(28, 28)),
            child: ColoredRadio<String>(
              activeColor: color.color,
              value: color.value,
              borderColor: color.value == 'White' ? Colors.black : null,
              groupValue: _groupValue,
              radius: widget.radius,
              onChanged: _onChanged,
            ),
          ),
        );
      }).toList(),
    );
  }

  void _onChanged(String value) {
    if (widget.onSelect != null) {
      widget.onSelect(value);
    }

    setState(() {
      _groupValue = value;
    });
  }
}
