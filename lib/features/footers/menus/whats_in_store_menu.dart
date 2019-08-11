import 'package:flutter/material.dart';
import 'package:shopmate/features/footers/widgets/footer_links.dart';
import 'package:shopmate/widgets/widgets.dart';

Widget whatsInStoreMenu = FooterLinks(
  title: 'WHATS IN STORE',
  items: [
    const LinkItem(title: 'Women', route: '/category/women'),
    const LinkItem(title: 'Men', route: '/category/men'),
    const LinkItem(title: 'Product A-Z', route: '/products'),
    const LinkItem(title: 'Buy Gif Vouchers', route: '/vouchers'),
  ],
);
