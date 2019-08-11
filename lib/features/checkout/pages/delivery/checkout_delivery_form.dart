part of checkout.pages;

class CheckoutDeliveryForm extends StatefulWidget {
  final ValueChanged<DeliveryFormData> onSubmit;
  final DeliveryFormData data;
  CheckoutDeliveryForm({
    Key key,
    this.data,
    this.onSubmit,
  }) : super(key: key);
  @override
  CheckoutDeliveryFormState createState() => CheckoutDeliveryFormState();
}

enum ShippingType { standard, express }

class CheckoutDeliveryFormState extends State<CheckoutDeliveryForm> {
  final _deliveryFormKey = GlobalKey<FormState>();
  DeliveryFormDataValidator _validator;

  @override
  void initState() {
    _validator = DeliveryFormDataValidator();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return _buildForm();
  }

  Widget _buildForm() {
    final theme = Theme.of(context);

    return Form(
      key: _deliveryFormKey,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Divider(),
          SideBySide(
            left: CheckoutFormField(
              label: 'First Name *',
              value: widget.data.firstName,
              onSaved: (String value) {
                widget.data.firstName = value;
              },
              validator: _validator.validateFirstName,
            ),
            right: CheckoutFormField(
              label: 'Last Name *',
              value: widget.data.lastName,
              onSaved: (String value) {
                widget.data.lastName = value;
              },
              validator: _validator.validateLastName,
            ),
          ),
          SideBySide(
            left: CheckoutFormField(
              label: 'Address *',
              value: widget.data.address,
              onSaved: (String value) {
                widget.data.address = value;
              },
              validator: _validator.validateAddress,
            ),
            right: CheckoutFormField(
              label: 'City *',
              value: widget.data.city,
              onSaved: (String value) {
                widget.data.city = value;
              },
              validator: _validator.validateCity,
            ),
          ),
          SideBySide(
            left: CheckoutFormField(
              label: 'State *',
              value: widget.data.state,
              onSaved: (String value) {
                widget.data.state = value;
              },
              validator: _validator.validateState,
            ),
            right: CheckoutFormField(
              label: 'ZipCode *',
              value: widget.data.zipCode,
              onSaved: (String value) {
                widget.data.zipCode = value;
              },
              validator: _validator.validateZipCode,
            ),
          ),
          Row(
            children: <Widget>[
              Text('Country:', style: theme.textTheme.display3),
              const SizedBox(width: 4),
              Text('Great Britain *', style: theme.textTheme.display3),
            ],
          ),
          const SizedBox(height: 18),
          Row(
            children: <Widget>[
              Checkbox(
                value: true,
                onChanged: (bool value) {},
              ),
              const SizedBox(width: 4),
              Text(
                'My billing information is the same as my delivery information',
                style: theme.textTheme.display3,
              ),
            ],
          ),
          const SizedBox(height: 24),
          const Line(height: 2),
          const SizedBox(height: 36),
          DeliveryOptions(
            value: widget.data.shipping,
            onChanged: (ShippingType value) {
              setState(() {
                widget.data.shipping = value;
              });
            },
          ),
        ],
      ),
    );
  }

  void submit() {
    if (_deliveryFormKey.currentState.validate()) {
      _deliveryFormKey.currentState.save();

      setState(() {
        widget.onSubmit(widget.data);
      });
    }
  }
}
