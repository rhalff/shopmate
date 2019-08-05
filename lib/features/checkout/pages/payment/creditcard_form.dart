part of checkout.pages;

class CreditCardForm extends StatefulWidget {
  @override
  _CreditCardFormState createState() => _CreditCardFormState();
}

class _CreditCardFormState extends State<CreditCardForm> {
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: _buildForm(),
    );
  }

  Widget _buildForm() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        SideBySide(
          left: CheckoutFormField(
            label: 'Cardholder\'s Name',
            validator: _validateName,
            suffixIcon: Icon(Icons.person_outline),
          ),
          right: CheckoutFormField(
            label: 'Card number',
            validator: _validateCardNumber,
            suffixIcon: Icon(Icons.credit_card),
          ),
        ),
        SideBySide(
          left: Expanded(
            child: Row(
              children: <Widget>[
                CheckoutFormField(
                  label: 'Valid thru',
                  validator: _validateThru,
                  suffixIcon: Icon(Icons.calendar_today),
                  hintText: 'MM / YY',
                ),
                SizedBox(width: 10),
                CheckoutFormField(
                  label: 'CVV / CVC *',
                  validator: _validateSecurityCode,
                ),
              ],
            ),
          ),
          right: Expanded(
            child: Text(
              '* CVV or CVC is the card security code, unique three digits number on the back of your card separate from its number.',
            ),
          ),
        ),
      ],
    );
  }

  String _validateName(String value) {
    return value;
  }

  String _validateCardNumber(String value) {
    return value;
  }

  String _validateThru(String value) {
    return value;
  }

  String _validateSecurityCode(String value) {
    return value;
  }
}
