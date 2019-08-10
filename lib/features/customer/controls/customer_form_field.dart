part of customer.controls;

class CustomerFormField extends StatefulWidget {
  final FocusNode focusNode;
  final FormFieldSetter<String> onSaved;
  final FormFieldValidator<String> validator;
  final List<TextInputFormatter> inputFormatters;
  final String placeholder;
  final String value;
  final TextAlign textAlign;
  final TextCapitalization textCapitalization;
  final TextInputAction textInputAction;
  final TextInputType keyboardType;
  final ValueChanged<String> onChange;
  final ValueChanged<String> onFieldSubmitted;
  final Widget child;
  final bool autovalidate;
  final bool enabled;
  final bool obscureText;
  final int maxLength;
  final int maxLines;

  CustomerFormField({
    this.autovalidate = false,
    this.child,
    this.enabled = true,
    this.focusNode,
    this.inputFormatters,
    this.keyboardType,
    this.maxLength,
    this.maxLines = 1,
    this.obscureText = false,
    this.onChange,
    this.onFieldSubmitted,
    this.onSaved,
    this.placeholder,
    this.textAlign = TextAlign.left,
    this.textCapitalization = TextCapitalization.none,
    this.textInputAction,
    this.validator,
    this.value,
  });

  @override
  _CustomerFormFieldState createState() => _CustomerFormFieldState();
}

class _CustomerFormFieldState extends State<CustomerFormField> {
  TextEditingController _controller;

  @override
  void initState() {
    super.initState();

    if (widget.value != null) {
      _controller = TextEditingController(text: widget.value);
    } else {
      _controller = TextEditingController();
    }
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
    widget.onChange(_controller.text);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: widget.child ?? _buildTextField(context),
    );
  }

  _buildTextField(context) {
    return Container(
      width: 350,
      child: TextFormField(
        // onChanged: _inputChanged,
        // textInputAction: TextInputAction.done,
        autovalidate: widget.autovalidate,
        controller: _controller,
        enabled: widget.enabled,
        focusNode: widget.focusNode,
        inputFormatters: widget.inputFormatters,
        keyboardType: widget.keyboardType,
        maxLength: widget.maxLength,
        maxLines: widget.maxLines,
        obscureText: widget.obscureText,
        onFieldSubmitted: widget.onFieldSubmitted,
        onSaved: widget.onSaved,
        textAlign: widget.textAlign,
        textInputAction: widget.textInputAction,
        validator: widget.validator,
        style: TextStyle(
          fontSize: 16,
          // height: widget.maxLines == null ? 15 : null,
          color: Colors.black,
          // fontWeight: FontWeight.bold,
        ),
        decoration: InputDecoration(
          hintText: widget.placeholder,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(6.0),
          ),
        ),
      ),
    );
  }
}
