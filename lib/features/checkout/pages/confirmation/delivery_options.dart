part of checkout.pages;

class DeliveryOptionsDetails extends StatelessWidget {
  final ShippingType shipping;
  DeliveryOptionsDetails({
    this.shipping,
  });
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Header4(
            'Delivery options',
            style: TextStyle(
              color: Color(0xFFB4B4B4),
            ),
          ),
          SizedBox(height: 18),
          Text(
            shipping == ShippingType.standard
                ? 'Standard delivery'
                : 'Express delivery',
            style: TextStyle(
              color: Color(0xFF2E2E2E),
            ),
          ),
          Text(
            '(free, 2-3 days)',
            style: TextStyle(
              color: Color(0xFF2E2E2E),
            ),
          ),
        ],
      ),
    );
  }
}
