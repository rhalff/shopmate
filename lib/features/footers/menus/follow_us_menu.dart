import 'package:flutter/material.dart';
import 'package:shopmate/features/footers/widgets/footer_links.dart';
import 'package:shopmate/widgets/widgets.dart';

Widget followUsMenu = FooterLinks(
  title: 'FOLLOW US',
  items: [
    LinkItem(title: 'Facebook', route: '/follow_us/facebook'),
    LinkItem(title: 'Twitter', route: '/follow_us/twitter'),
    LinkItem(title: 'YouTube', route: '/follow_us/youtube'),
  ],
);
