part of catalog.widgets;

class SizesDropDown extends StatefulWidget {
  final List<ProductAttribute> sizes;
  final ValueChanged<ProductAttribute> onChanged;
  final String value;
  SizesDropDown({
    @required this.value,
    @required this.sizes,
    this.onChanged,
  }) : assert(sizes != null);
  @override
  _SizesDropDownState createState() => _SizesDropDownState();
}

class _SizesDropDownState extends State<SizesDropDown> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    final items = widget.sizes
        .map((ProductAttribute attribute) => attribute.value)
        .toList();

    return DropdownButton(
      value: widget.value,
      hint: Text('Size', style: theme.textTheme.body2),
      onChanged: _onChanged,
      items: _buildDropDownMenuItems(context, items),
    );
  }

  void _onChanged(String value) {
    if (widget.onChanged != null) {
      final attribute = widget.sizes
          .firstWhere((ProductAttribute size) => size.value == value);

      widget.onChanged(attribute);
    }
  }

  List<DropdownMenuItem<String>> _buildDropDownMenuItems(
      BuildContext context, List<String> items) {
    final theme = Theme.of(context);

    return items.map((String value) {
      return DropdownMenuItem<String>(
        value: value,
        child: Text(value, style: theme.textTheme.body2),
      );
    }).toList();
  }
}
