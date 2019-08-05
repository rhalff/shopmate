import 'package:flutter/material.dart';
import 'package:shopmate/features/footers/social_icons.dart';
import 'package:shopmate/widgets/widgets.dart';

class Footer2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 800,
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.all(15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                NavLink(
                  LinkItem(title: 'Women', route: '/category/woman'),
                  style: Theme.of(context).textTheme.subtitle,
                ),
                NavLink(
                  LinkItem(title: 'Men', route: '/category/men'),
                  style: Theme.of(context).textTheme.subtitle,
                ),
                NavLink(
                  LinkItem(title: 'Kids', route: '/category/kids'),
                  style: Theme.of(context).textTheme.subtitle,
                ),
                NavLink(
                  LinkItem(title: 'Shoes', route: '/category/shoes'),
                  style: Theme.of(context).textTheme.subtitle,
                ),
                NavLink(
                  LinkItem(title: 'Brands', route: '/category/brands'),
                  style: Theme.of(context).textTheme.subtitle,
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.all(15),
            child: FractionallySizedBox(
              widthFactor: 0.25,
              child: socialIcons,
            ),
          ),
          Padding(
            padding: EdgeInsets.all(15),
            child: FractionallySizedBox(
              widthFactor: 0.5,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Text('©2016 shopmate Ltd'),
                  Text('•'),
                  NavLink(
                    LinkItem(title: 'Contact', route: '/contact'),
                  ),
                  Text('•'),
                  NavLink(
                    LinkItem(title: 'Privacy policy', route: '/privacy_policy'),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
