import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:page_transition/page_transition.dart';

import 'features/auth/blocs/blocs.dart';
import 'features/cart/widgets/widgets.dart';
import 'features/customer/models/models.dart';
import 'features/customer/screens/screens.dart';
import 'navigation/bottom_button.dart';
import 'widgets/widgets.dart';

final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

class ShopLayout extends StatefulWidget {
  final Widget body;
  final bool showBottomNavigationBar;
  final List<Widget> persistentFooterButtons;
  final Widget top;
  final String backgroundImage;
  final Customer customer;
  ShopLayout({
    @required this.body,
    this.top,
    this.customer,
    this.showBottomNavigationBar = true,
    this.persistentFooterButtons,
    this.backgroundImage,
  }) : assert(body != null);
  @override
  _ShopLayoutState createState() => _ShopLayoutState();
}

class _ShopLayoutState extends State<ShopLayout> {
  static final _items = <LinkItem>[
    LinkItem(
      title: 'Register',
      route: SignUpScreen.route,
      icon: Icon(
        Icons.person,
        color: Colors.white,
      ),
    ),
    LinkItem(
      title: 'Login',
      route: SignInScreen.route,
      icon: Icon(
        Icons.person,
        color: Colors.white,
      ),
    ),
  ];

  AuthBloc _authBloc;

  @override
  void initState() {
    _authBloc = BlocProvider.of<AuthBloc>(context);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final size = MediaQuery.of(context).size;
    Color backgroundColor;
    double elevation;
    Color appBarColor;

    if (widget.backgroundImage != null) {
      backgroundColor = Colors.transparent;
      appBarColor = theme.accentColor;
      elevation = 4;
    } else {
      appBarColor = theme.accentColor;
      elevation = 4;
    }

    final child = BlocBuilder(
      bloc: _authBloc,
      builder: (BuildContext context, AuthState state) {
        return Scaffold(
          backgroundColor: backgroundColor,
          bottomNavigationBar: widget.showBottomNavigationBar
              ? _buildBottomNavigationBar(context, state)
              : null,
          persistentFooterButtons: widget.persistentFooterButtons,
          appBar: AppBar(
            backgroundColor: appBarColor,
            elevation: elevation,
            title: widget.top,
            actions: <Widget>[
              CartIconButton(),
              const SizedBox(width: 24),
            ],
          ),
          body: widget.body,
        );
      },
    );

    if (widget.backgroundImage != null) {
      return BackgroundImage(
        image: widget.backgroundImage,
        size: size,
        child: child,
      );
    }

    return child;
  }

  BottomNavigationBar _buildBottomNavigationBar(
      BuildContext context, AuthState state) {
    final theme = Theme.of(context);
    final textTheme = theme.textTheme.body1.copyWith(
      color: Colors.white,
      fontWeight: FontWeight.bold,
    );

    List<LinkItem> items;
    if (state is Authenticated) {
      items = <LinkItem>[
        LinkItem(
          title: 'Profile',
          route: ProfileScreen.route,
          icon: Icon(
            Icons.person,
            color: Colors.white,
          ),
        ),
        LinkItem(
          title: 'Logout',
          onTap: () => _logout(context),
          icon: Icon(
            Icons.person,
            color: Colors.white,
          ),
        ),
      ];
    } else {
      items = _items;
    }

    return BottomNavigationBar(
      backgroundColor: Colors.black,
      currentIndex: 0,
      onTap: (int index) => _onItemTap(items[index], index),
      items: items.map((LinkItem link) {
        return BottomButton(
          icon: link.icon,
          title: link.title,
          style: textTheme,
        );
      }).toList(),
    );
  }

  void _logout(BuildContext context) {
    _authBloc.dispatch(SignOut());
  }

  void _onItemTap(LinkItem item, num index) {
    if (item.onTap != null) {
      item.onTap();
    } else {
      Alignment alignment;
      if (index == 0) {
        alignment = Alignment.bottomLeft;
      } else if (index == 1) {
        alignment = Alignment.bottomRight;
      } else {
        alignment = Alignment.bottomCenter;
      }

      Navigator.of(context).pushNamed(item.route, arguments: {
        'transition': PageTransitionType.scale,
        'alignment': alignment,
      });
    }
  }
}

class BackgroundImage extends StatelessWidget {
  final Widget child;
  final String image;
  final Size size;
  BackgroundImage({
    this.child,
    this.image,
    this.size,
  })  : assert(child != null),
        assert(image != null);
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(image),
          fit: BoxFit.cover,
        ),
      ),
      child: child,
    );
  }
}
