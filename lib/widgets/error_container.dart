part of widgets;

class ErrorContainer extends StatelessWidget {
  final String title;
  final String error;
  ErrorContainer({
    this.title,
    this.error,
  }) : assert(error != null);
  @override
  Widget build(BuildContext context) {
    print(error);
    return Center(
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(18.0),
          child: Text(
            title ?? error.toString(),
            style: TextStyle(
              color: Colors.red,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
