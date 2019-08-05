part of checkout.pages;

class DeliveryOptions extends StatefulWidget {
  final ValueChanged<ShippingType> onChanged;
  final ShippingType value;
  DeliveryOptions({
    this.value = ShippingType.standard,
    this.onChanged,
  });
  @override
  _DeliveryOptionsState createState() => _DeliveryOptionsState();
}

class _DeliveryOptionsState extends State<DeliveryOptions> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final numberFormat = NumberFormat.simpleCurrency(name: 'GBP');

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Header('Delivery Options'),
        SizedBox(height: 15),
        Wrap(
          children: <Widget>[
            Row(
              children: <Widget>[
                Radio<ShippingType>(
                  value: ShippingType.standard,
                  groupValue: widget.value,
                  onChanged: _onChanged,
                ),
                Text(
                  'Standard shipping:',
                  style: theme.textTheme.display3,
                ),
                SizedBox(width: 15),
                Text('(free, 2-3 business days)'),
              ],
            ),
            Row(
              children: <Widget>[
                Radio<ShippingType>(
                  value: ShippingType.express,
                  groupValue: widget.value,
                  onChanged: _onChanged,
                ),
                Text(
                  'Express shipping:',
                  style: theme.textTheme.display3,
                ),
                SizedBox(width: 15),
                Text('(${numberFormat.format(28)}, 1-2 business days)'),
              ],
            )
          ],
        )
      ],
    );
  }

  void _onChanged(ShippingType value) {
    if (widget.onChanged != null) {
      widget.onChanged(value);
    }
  }
}
