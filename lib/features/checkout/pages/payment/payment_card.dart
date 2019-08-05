part of checkout.pages;

class PaymentCard extends StatefulWidget {
  final String value;
  final String label;
  final Icon logo;
  final String groupValue;
  final ValueChanged<String> onChanged;
  PaymentCard({
    this.label,
    this.logo,
    this.value,
    this.groupValue,
    this.onChanged,
  });
  @override
  _PaymentCardState createState() => _PaymentCardState();
}

class _PaymentCardState extends State<PaymentCard> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Container(
      width: 270,
      margin: EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: _color,
        border: Border.all(color: _borderColor),
      ),
      child: Material(
        child: InkWell(
          onTap: () => widget.onChanged(widget.value),
          child: Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 15,
              horizontal: 15,
            ),
            child: Column(
              children: <Widget>[
                widget.logo,
                Row(
                  children: <Widget>[
                    Radio<String>(
                      value: widget.value,
                      groupValue: widget.groupValue,
                      onChanged: widget.onChanged,
                    ),
                    Text(
                      widget.label,
                      style: theme.textTheme.display3,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  get _color {
    return widget.groupValue == widget.value
        ? Color(0xFFF3F6F9)
        : Color(0xFFF9F9F9);
  }

  get _borderColor {
    return widget.groupValue == widget.value
        ? Color(0xFF6EB2FB)
        : Color(0xFFD8D8D8);
  }
}
