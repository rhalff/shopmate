part of checkout.screens;

class CheckoutScreen extends StatefulWidget {
  static const route = '/checkout';

  @override
  _CheckoutScreenState createState() => _CheckoutScreenState();
}

class _CheckoutScreenState extends State<CheckoutScreen> {
  final _deliveryPageKey = GlobalKey<CheckoutDeliveryFormState>();
  CartBloc _cartBloc;
  DeliveryFormData _deliveryFormData;
  int step = 0;

  @override
  void initState() {
    _cartBloc = BlocProvider.of<CartBloc>(context);

    _deliveryFormData = DeliveryFormData();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    if (!(_cartBloc?.currentState is CartLoaded)) {
      return Center(child: const CircularProgressIndicator());
    }

    Widget child;
    var footerButtons = <Widget>[];

    if (step == 0) {
      child = CheckoutDeliveryForm(
          key: _deliveryPageKey,
          data: _deliveryFormData,
          onSubmit: (DeliveryFormData data) {
            setState(() {
              step = 1;
              _deliveryFormData = data;
            });
          });

      footerButtons = _buildNextPreviousButtons(() {
        _deliveryPageKey.currentState.submit();
      });
    } else if (step == 1) {
      child = CheckoutConfirmationPage(
        deliveryData: _deliveryFormData,
      );
      footerButtons = _buildNextPreviousButtons(() {
        setState(() {
          step++;
        });
      });
    } else if (step == 2) {
      child = CheckoutPaymentPage();
      footerButtons = _buildNextPreviousButtons(() {
        setState(() {
          step++;
        });
      });
    } else if (step == 3) {
      child = CheckoutFinishPage();
      footerButtons = null;
    }

    return CheckoutPage(
      title: 'Checkout',
      steps: <String>[
        'Delivery',
        'Confirmation',
        'Payment',
        'Finish',
      ],
      currentStep: step,
      child: child,
      footerButtons: footerButtons,
    );
  }

  List<Widget> _buildNextPreviousButtons(VoidCallback handleNextStep) {
    final theme = Theme.of(context);
    return <Widget>[
      RoundedButton(
        text: 'Back',
        onPressed: () {
          setState(() {
            if (step == 0) {
              Navigator.of(context).pop();
            } else {
              step--;
            }
          });
        },
        style: TextStyle(color: theme.accentColor),
        backgroundColor: Colors.white,
      ),
      if (handleNextStep != null)
        RoundedButton(
          text: 'Next Step',
          onPressed: handleNextStep,
        ),
    ];
  }
}
