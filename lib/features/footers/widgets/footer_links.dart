import 'package:flutter/material.dart';
import 'package:shopmate/widgets/widgets.dart';

class FooterLinks extends StatelessWidget {
  final String title;
  final List<LinkItem> items;
  FooterLinks({
    this.title,
    this.items = const [],
  });
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(bottom: 15),
          child: Text(
            title,
            textScaleFactor: 1.3,
          ),
        ),
        ..._buildItems(context),
      ],
    );
  }

  _buildItems(BuildContext context) {
    return items.map((item) {
      return GestureDetector(
        onTap: () => Navigator.of(context).pushNamed(item.route),
        child: Padding(
          padding: EdgeInsets.only(bottom: 5),
          child: Text(
            item.title,
          ),
        ),
      );
    }).toList();
  }
}
