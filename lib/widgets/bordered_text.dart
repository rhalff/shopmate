part of widgets;

/// Adds stroke to text widget /// {@tool sample}
/// We can apply a very thin and subtle stroke to a [Text]
/// ```dart
/// BorderedText(
///   strokeWidth: 1.0,
///   text: Text(
///     'Bordered Text',
///     style: TextStyle(
///       decoration: TextDecoration.none,
///       decorationStyle: TextDecorationStyle.wavy,
///       decorationColor: Colors.red,
///     ),
///   ),
/// )
/// ```
/// {@end-tool}
class BorderedText extends StatelessWidget {
  BorderedText({
    this.strokeCap = StrokeCap.round,
    this.strokeJoin = StrokeJoin.round,
    this.strokeWidth = 1.0,
    this.strokeColor = Colors.black,
    @required this.child,
  }) : assert(child != null);

  /// the stroke cap style
  final StrokeCap strokeCap;

  /// the stroke joint style
  final StrokeJoin strokeJoin;

  /// the stroke width
  final double strokeWidth;

  /// the stroke color
  final Color strokeColor;

  /// the `Text` widget to apply stroke on
  final Text child;
  @override
  Widget build(BuildContext context) {
    TextStyle style;
    if (child.style != null) {
      style = child.style.copyWith(
        foreground: Paint()
          ..style = PaintingStyle.stroke
          ..strokeCap = strokeCap
          ..strokeJoin = strokeJoin
          ..strokeWidth = strokeWidth
          ..color = strokeColor,
        color: null,
      );
    } else {
      style = TextStyle(
        foreground: Paint()
          ..style = PaintingStyle.stroke
          ..strokeCap = strokeCap
          ..strokeJoin = strokeJoin
          ..strokeWidth = strokeWidth
          ..color = strokeColor,
      );
    }
    return Stack(
      alignment: Alignment.center,
      textDirection: TextDirection.ltr,
      children: [
        Text(
          child.data,
          style: style,
          maxLines: child.maxLines,
          overflow: child.overflow,
          semanticsLabel: child.semanticsLabel,
          softWrap: child.softWrap,
          strutStyle: child.strutStyle,
          textAlign: child.textAlign,
          textDirection: child.textDirection,
          textScaleFactor: child.textScaleFactor,
          textWidthBasis: child.textWidthBasis,
        ),
        child,
      ],
    );
  }
}
