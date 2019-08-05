part of checkout.pages;

class CheckoutPaymentPage extends StatefulWidget {
  @override
  _CheckoutPaymentPageState createState() => _CheckoutPaymentPageState();
}

class _CheckoutPaymentPageState extends State<CheckoutPaymentPage> {
  String _groupValue;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 800,
      height: 500,
      child: Column(
        children: <Widget>[
          SizedBox(height: 18),
          Wrap(
            // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              PaymentCard(
                logo: Icon(Icons.credit_card),
                label: 'Pay with credit card',
                value: 'creditcard',
                groupValue: _groupValue,
                onChanged: _onChanged,
                // color: Color(0xFF6EB2FB),
              ),
              PaymentCard(
                logo: Icon(Icons.payment),
                label: 'Pay with Paypal',
                value: 'paypal',
                groupValue: _groupValue,
                onChanged: _onChanged,
                // color: Color(0xFF6EB2FB),
              ),
            ],
          ),
          SizedBox(height: 48),
          if (_groupValue == 'creditcard') CreditCardForm()
        ],
      ),
    );
  }

  void _onChanged(String value) {
    setState(() {
      _groupValue = value;
    });
  }
}
