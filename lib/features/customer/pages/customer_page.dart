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
    final isLargeScreen = MediaQuery.of(context).size.width > 600;

    return Scaffold(
      body: SafeArea(
        child: ScrollPage(
          child: Container(
            color: Colors.white,
            child: Column(
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    IconButton(
                      iconSize: isLargeScreen ? 48 : 24,
                      icon: const Icon(
                        Icons.close,
                        color: Color(0xFF2E2E2E),
                      ),
                      tooltip:
                          MaterialLocalizations.of(context).closeButtonTooltip,
                      onPressed: () {
                        Navigator.maybePop(context);
                      },
                    )
                  ],
                ),
                Center(
                  child: Column(
                    children: <Widget>[
                      const SizedBox(height: 50),
                      if (title != null) Header(title),
                      const SizedBox(height: 50),
                      child,
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      persistentFooterButtons: footerButtons,
    );
  }
}
