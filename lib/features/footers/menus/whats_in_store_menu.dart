import 'package:flutter/material.dart';
import 'package:shopmate/features/footers/widgets/footer_links.dart';
import 'package:shopmate/widgets/widgets.dart';

Widget whatsInStoreMenu = FooterLinks(
  title: 'WHATS IN STORE',
  items: [
    LinkItem(title: 'Women', route: '/category/women'),
    LinkItem(title: 'Men', route: '/category/men'),
    LinkItem(title: 'Product A-Z', route: '/products'),
    LinkItem(title: 'Buy Gif Vouchers', route: '/vouchers'),
  ],
);
