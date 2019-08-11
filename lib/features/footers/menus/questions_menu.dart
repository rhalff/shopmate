import 'package:flutter/material.dart';
import 'package:shopmate/features/footers/widgets/footer_links.dart';
import 'package:shopmate/widgets/widgets.dart';

Widget questionsMenu = FooterLinks(
  title: 'QUESTIONS?',
  items: [
    const LinkItem(title: 'Help', route: '/help'),
    const LinkItem(title: 'Track Order', route: '/track_order'),
    const LinkItem(title: 'Returns', route: '/returns'),
  ],
);
