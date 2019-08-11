import 'package:flutter/material.dart';
import 'package:shopmate/features/footers/widgets/footer_links.dart';
import 'package:shopmate/widgets/widgets.dart';

Widget followUsMenu = FooterLinks(
  title: 'FOLLOW US',
  items: [
    const LinkItem(title: 'Facebook', route: '/follow_us/facebook'),
    const LinkItem(title: 'Twitter', route: '/follow_us/twitter'),
    const LinkItem(title: 'YouTube', route: '/follow_us/youtube'),
  ],
);
