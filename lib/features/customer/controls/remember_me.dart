part of customer.controls;

class RememberMe extends StatelessWidget {
  final ValueChanged<bool> onSaved;
  final bool value;
  RememberMe({
    @required this.onSaved,
    this.value = false,
  })  : assert(value is bool),
        assert(onSaved != null);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Checkbox(
          value: value,
          onChanged: onSaved,
        ),
        Text(
          'Remember',
          style: theme.textTheme.body1.copyWith(
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}
