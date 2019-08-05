part of customer.pages;

class CustomerPage extends StatelessWidget {
  final String title;
  final Widget child;
  final List<Widget> footerButtons;
  CustomerPage({
    this.title,
    this.child,
    this.footerButtons = const [],
  });
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ScrollPage(
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 64.0),
            color: Colors.white,
            child: Center(
              child: Column(
                children: <Widget>[
                  SizedBox(height: 50),
                  if (title != null) Header(title),
                  SizedBox(height: 50),
                  child,
                ],
              ),
            ),
          ),
        ),
      ),
      persistentFooterButtons: footerButtons,
    );
  }
}
