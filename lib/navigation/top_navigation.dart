import 'package:flutter/material.dart';
import 'package:shopmate/widgets/widgets.dart';

class TopNavigation extends StatelessWidget {
  final List<LinkItem> items;
  TopNavigation({
    this.items,
  });
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: items.map(
          (LinkItem linkItem) {
            return NavLink(
              linkItem,
              style: TextStyle(
                color: Colors.white,
              ),
            );
          },
        ).toList(),
      ),
    );
  }
}
