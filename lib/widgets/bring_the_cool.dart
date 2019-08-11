part of widgets;

class BringTheCool extends StatefulWidget {
  final List<Department> departments;
  BringTheCool({
    this.departments,
  });
  @override
  _BringTheCoolState createState() => _BringTheCoolState();
}

class _BringTheCoolState extends State<BringTheCool> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          BorderedText(
            strokeWidth: 3,
            child: Text(
              'Bring the cool',
              textAlign: TextAlign.center,
              style: theme.textTheme.subhead.copyWith(
                color: Colors.white,
              ),
            ),
          ),
          const SizedBox(height: 35),
          BorderedText(
            strokeWidth: 1,
            child: Text(
              'See what\'s in store!',
              style: theme.textTheme.subtitle.copyWith(
                color: Colors.white,
              ),
            ),
          ),
          const SizedBox(height: 35),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: widget.departments.map(
              (department) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: RoundedButton(
                    text: department.name,
                    onPressed: () => Navigator.of(context).pushNamed(
                      DepartmentScreen.route,
                      arguments: {
                        'department': department,
                      },
                    ),
                  ),
                );
              },
            ).toList(),
          )
        ],
      ),
    );
  }
}
