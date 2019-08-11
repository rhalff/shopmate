import 'package:flutter/material.dart';

import 'menus/menus.dart';

class Footer1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 800,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          questionsMenu,
          whatsInStoreMenu,
          followUsMenu,
          const Text('©2016 shopmate Ltd'),
        ],
      ),
    );
  }
}
