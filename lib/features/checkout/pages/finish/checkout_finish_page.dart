part of checkout.pages;

class CheckoutFinishPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Center(
      child: Column(
        children: <Widget>[
          SizedBox(
            width: 280,
            height: 251,
            child: Vector(Vectors.rocket),
          ),
          Text(
            'Success!',
            style: theme.textTheme.title,
          ),
          const SizedBox(height: 24),
          const Text('Your items will be shipped shortly,'),
          const Text('you will get an email with details,'),
          const SizedBox(height: 40),
          RoundedButton(
            text: 'Back to shop',
            onPressed: () => goHome(context),
          )
        ],
      ),
    );
  }
}
