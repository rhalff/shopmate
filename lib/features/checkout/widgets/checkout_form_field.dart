part of checkout.widgets;

class CheckoutFormField extends StatefulWidget {
  final FocusNode focusNode;
  final FormFieldSetter<String> onSaved;
  final FormFieldValidator<String> validator;
  final Icon prefixIcon;
  final Icon suffixIcon;
  final String hintText;
  final String label;
  final String labelText;
  final String value;
  final TextInputAction textInputAction;
  final TextInputType keyboardType;
  final ValueChanged<String> onChange;
  final ValueChanged<String> onFieldSubmitted;
  CheckoutFormField({
    this.focusNode,
    this.hintText,
    this.keyboardType,
    this.label,
    this.labelText,
    this.onChange,
    this.onFieldSubmitted,
    this.onSaved,
    this.prefixIcon,
    this.suffixIcon,
    this.textInputAction,
    this.validator,
    this.value = '',
  });

  @override
  _CheckoutFormFieldState createState() => _CheckoutFormFieldState();
}

class _CheckoutFormFieldState extends State<CheckoutFormField> {
  TextEditingController _controller;

  @override
  void initState() {
    super.initState();

    _controller = TextEditingController(text: widget.value);
    if (widget.onChange != null) {
      _controller.addListener(_onChange);
    }
  }

  @override
  void dispose() {
    _controller.removeListener(_onChange);
    super.dispose();
  }

  void _onChange() {
    if (widget.onChange != null) {
      widget.onChange(_controller.text);
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isLargeScreen = MediaQuery.of(context).size.width > 600;
    return CheckoutFormLabel(
      label: widget.label,
      child: TextFormField(
        controller: _controller,
        focusNode: widget.focusNode,
        keyboardType: widget.keyboardType,
        textInputAction: widget.textInputAction,
        onSaved: widget.onSaved,
        onFieldSubmitted: widget.onFieldSubmitted,
        validator: widget.validator,
        style: theme.textTheme.body2,
        decoration: isLargeScreen
            ? InputDecoration(
                suffixIcon: widget.suffixIcon,
                prefixIcon: widget.prefixIcon,
                hintText: widget.hintText,
                labelText: widget.labelText,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(6.0),
                ),
              )
            : null,
      ),
    );
  }
}
