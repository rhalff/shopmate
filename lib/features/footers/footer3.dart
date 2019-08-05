import 'package:flutter/material.dart';
import 'package:shopmate/features/footers/social_icons.dart';

import 'menus/menus.dart';

class Footer3 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(18),
      // width: 900,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    '1 800 2 000 000  ',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Text('info@shopmate.com'),
                ],
              ),
              Padding(
                padding: EdgeInsets.all(15),
                child: socialIcons,
              )
            ],
          ),
          questionsMenu,
          whatsInStoreMenu,
          followUsMenu,
        ],
      ),
    );
  }
}
