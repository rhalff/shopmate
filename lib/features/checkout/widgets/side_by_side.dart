part of checkout.widgets;

class SideBySide extends StatelessWidget {
  final Widget left;
  final Widget right;
  SideBySide({
    this.left,
    this.right,
  });
  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        left,
        const SizedBox(width: 20),
        right,
      ],
    );
  }
}
