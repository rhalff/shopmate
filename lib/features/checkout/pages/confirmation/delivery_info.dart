part of checkout.pages;

class DeliveryInfo extends StatelessWidget {
  final DeliveryFormData deliveryData;
  DeliveryInfo({
    @required this.deliveryData,
  }) : assert(deliveryData != null);
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Header3('Delivery'),
          SizedBox(height: 15),
          DeliveryAddress(
            deliveryData: deliveryData,
          ),
          SizedBox(height: 15),
          DeliveryOptionsDetails(
            shipping: deliveryData.shipping,
          ),
        ],
      ),
    );
  }
}
