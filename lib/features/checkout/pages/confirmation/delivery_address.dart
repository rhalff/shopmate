part of checkout.pages;

class DeliveryAddress extends StatelessWidget {
  final DeliveryFormData deliveryData;
  DeliveryAddress({
    this.deliveryData,
  });
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Header4(
            'Address',
            style: TextStyle(
              color: const Color(0xFFB4B4B4),
            ),
          ),
          const SizedBox(height: 18),
          Text(
            '${deliveryData.address}',
            style: TextStyle(
              color: const Color(0xFF2E2E2E),
            ),
          ),
          Text(
            '${deliveryData.city}, ${deliveryData.country}, ${deliveryData.zipCode}',
            style: TextStyle(
              color: const Color(0xFF2E2E2E),
            ),
          ),
        ],
      ),
    );
  }
}
