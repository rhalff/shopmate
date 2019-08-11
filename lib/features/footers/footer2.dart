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
            padding: const EdgeInsets.all(15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                NavLink(
                  const LinkItem(title: 'Women', route: '/category/woman'),
                  style: Theme.of(context).textTheme.subtitle,
                ),
                NavLink(
                  const LinkItem(title: 'Men', route: '/category/men'),
                  style: Theme.of(context).textTheme.subtitle,
                ),
                NavLink(
                  const LinkItem(title: 'Kids', route: '/category/kids'),
                  style: Theme.of(context).textTheme.subtitle,
                ),
                NavLink(
                  const LinkItem(title: 'Shoes', route: '/category/shoes'),
                  style: Theme.of(context).textTheme.subtitle,
                ),
                NavLink(
                  const LinkItem(title: 'Brands', route: '/category/brands'),
                  style: Theme.of(context).textTheme.subtitle,
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(15),
            child: FractionallySizedBox(
              widthFactor: 0.25,
              child: socialIcons,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(15),
            child: FractionallySizedBox(
              widthFactor: 0.5,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  const Text('©2016 shopmate Ltd'),
                  const Text('•'),
                  NavLink(
                    const LinkItem(title: 'Contact', route: '/contact'),
                  ),
                  const Text('•'),
                  NavLink(
                    const LinkItem(
                        title: 'Privacy policy', route: '/privacy_policy'),
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
