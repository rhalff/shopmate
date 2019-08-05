import 'package:flutter/material.dart';
import 'package:shopmate/features/footers/widgets/footer_links.dart';
import 'package:shopmate/widgets/widgets.dart';

Widget questionsMenu = FooterLinks(
  title: 'QUESTIONS?',
  items: [
    LinkItem(title: 'Help', route: '/help'),
    LinkItem(title: 'Track Order', route: '/track_order'),
    LinkItem(title: 'Returns', route: '/returns'),
  ],
);
