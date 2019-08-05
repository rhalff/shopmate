part of catalog.pages;

class ProductReviewFormFieldLabel extends StatelessWidget {
  final String label;
  ProductReviewFormFieldLabel({
    @required this.label,
  }) : assert(label != null);
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Text(
      label,
      style: theme.textTheme.display4,
    );
  }
}

class ProductReviewFormField extends StatefulWidget {
  final String label;
  final int maxLines;
  final Widget child;
  final String value;
  final int maxLength;
  final FocusNode focusNode;
  final ValueChanged<String> onFieldSubmitted;
  final FormFieldValidator<String> validator;
  final List<TextInputFormatter> inputFormatters;
  final TextInputAction textInputAction;
  final FormFieldSetter<String> onSaved;
  final String placeholder;
  final TextAlign textAlign;
  final bool enabled;

  ProductReviewFormField({
    this.enabled = true,
    this.label,
    this.placeholder,
    this.onFieldSubmitted,
    this.validator,
    this.inputFormatters,
    this.maxLines,
    this.maxLength,
    this.focusNode,
    this.textInputAction,
    this.textAlign = TextAlign.left,
    this.onSaved,
    this.child,
    this.value = '',
  });

  @override
  _ProductReviewFormFieldState createState() => _ProductReviewFormFieldState();
}

class _ProductReviewFormFieldState extends State<ProductReviewFormField> {
  TextEditingController _textFieldController;

  @override
  void initState() {
    super.initState();
    _textFieldController = TextEditingController(
      text: widget.value.toString(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          if (widget.label != null)
            Expanded(
              flex: 1,
              child: ProductReviewFormFieldLabel(label: widget.label),
            ),
          Expanded(
            flex: 2,
            child: widget.child ?? _buildTextField(context),
          ),
          // Spacer(flex: 2),
        ],
      ),
    );
  }

  _buildTextField(context) {
    return Container(
      width: 45,
      // height: widget.maxLines == null ? 35 : null,
      child: TextFormField(
        controller: _textFieldController,
        textInputAction: widget.textInputAction,
        textAlign: widget.textAlign,
        // textInputAction: TextInputAction.done,
        // onChanged: _inputChanged,
        maxLines: widget.maxLines,
        validator: widget.validator,
        enabled: widget.enabled,
        inputFormatters: widget.inputFormatters,
        maxLength: widget.maxLength,
        focusNode: widget.focusNode,
        onFieldSubmitted: widget.onFieldSubmitted,
        onSaved: widget.onSaved,
        style: TextStyle(
          fontSize: 12,
          // height: widget.maxLines == null ? 15 : null,
          color: Colors.black,
          fontWeight: FontWeight.bold,
        ),
        decoration: InputDecoration(
          hintText: widget.placeholder,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16.0),
          ),
        ),
      ),
    );
  }
}
