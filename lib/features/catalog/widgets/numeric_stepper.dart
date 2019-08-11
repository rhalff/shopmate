part of catalog.widgets;

const _kMaxValueDefault = 999999;

class NumericStepper extends StatefulWidget {
  final int value;
  final ValueChanged<int> onChanged;
  final VoidCallback onIncrease;
  final VoidCallback onDecrease;
  final int minValue;
  final int maxValue;
  NumericStepper({
    this.value = 1,
    this.minValue = 0,
    this.maxValue = _kMaxValueDefault,
    this.onChanged,
    this.onIncrease,
    this.onDecrease,
  });

  @override
  _NumericStepperState createState() => _NumericStepperState(value);
}

class _NumericStepperState extends State<NumericStepper> {
  TextEditingController _textFieldController;
  final int value;
  _NumericStepperState(this.value);

  @override
  void initState() {
    super.initState();
    _textFieldController = TextEditingController(text: value.toString());
  }

  @override
  Widget build(BuildContext context) {
    final isLargeScreen = MediaQuery.of(context).size.width > 600;
    final buttonSize = isLargeScreen ? 36.0 : 18.0;

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        CircularButton(
          constraints: BoxConstraints(
            minWidth: buttonSize,
            minHeight: buttonSize, // 36.0,
          ),
          child: Icon(
            Icons.remove,
            color: Colors.black,
            size: isLargeScreen ? 28.0 : 14.0,
          ),
          onPressed: _canDecrease ? _decrease : null,
        ),
        Container(
          width: isLargeScreen ? 45 : 22.5,
          height: isLargeScreen ? 35 : 17.5,
          child: TextField(
            controller: _textFieldController,
            textAlign: TextAlign.center,
            textAlignVertical: TextAlignVertical.center,
            keyboardType: const TextInputType.numberWithOptions(decimal: false),
            onChanged: _inputChanged,
            style: TextStyle(
              fontSize: isLargeScreen ? 14 : 7,
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
            decoration: InputDecoration(
              contentPadding: EdgeInsets.symmetric(
                vertical: isLargeScreen ? 10.0 : 5,
                horizontal: isLargeScreen ? 10.0 : 5,
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(16.0),
              ),
            ),
          ),
        ),
        CircularButton(
          constraints: BoxConstraints(
            minWidth: buttonSize,
            minHeight: buttonSize,
          ),
          child: Icon(
            Icons.add,
            color: Colors.black,
            size: isLargeScreen ? 28 : 14,
          ),
          onPressed: _canIncrease ? _increase : null,
        ),
      ],
    );
  }

  int get _currentValue {
    return int.parse(_textFieldController.text);
  }

  void _inputChanged(String value) {
    if (widget.onChanged != null) {
      widget.onChanged(int.parse(value));
    }
  }

  bool get _canIncrease {
    return _currentValue < widget.maxValue;
  }

  bool get _canDecrease {
    return _currentValue > widget.minValue;
  }

  void _decrease() {
    if (_canDecrease) {
      _stepValue(-1);

      if (widget.onDecrease != null) {
        widget.onDecrease();
      }
    }
  }

  void _increase() {
    if (_canIncrease) {
      _stepValue(1);

      if (widget.onIncrease != null) {
        widget.onIncrease();
      }
    }
  }

  void _stepValue(int step) {
    final newValue = _currentValue + step;

    if (widget.onChanged != null) {
      widget.onChanged(newValue);
    }
    setState(() {
      _textFieldController.text = newValue.toString();
    });
  }
}

class CircularButton extends StatelessWidget {
  final Widget child;
  final VoidCallback onPressed;
  final BoxConstraints constraints;
  const CircularButton({
    this.child,
    this.onPressed,
    this.constraints = const BoxConstraints(
      minWidth: 36.0,
      minHeight: 36.0,
    ),
  });

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      onPressed: onPressed,
      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
      child: child,
      shape: CircleBorder(),
      elevation: 0,
      fillColor: DocumentColors[7],
      constraints: constraints,
    );
  }
}
