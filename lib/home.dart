import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopmate/shop_layout.dart';
import 'package:shopmate/widgets/widgets.dart';

import 'features/catalog/blocs/blocs.dart';
import 'navigation/department_navigation.dart';

class Home extends StatefulWidget {
  static const route = '/';
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  DepartmentsBloc _departmentsBloc;

  void initState() {
    super.initState();

    _departmentsBloc = BlocProvider.of<DepartmentsBloc>(context);
  }

  @override
  Widget build(BuildContext context) {
    return ShopLayout(
      top: _buildTop(),
      body: _buildBody(),
      backgroundImage: 'assets/image1.png',
    );
  }

  Widget _buildTop() {
    return Row(
      children: <Widget>[
        const Text('SHOPMATE'),
        DepartmentNavigation(),
      ],
    );
  }

  Widget _buildBody() {
    return BlocBuilder(
      bloc: _departmentsBloc,
      builder: (BuildContext context, DepartmentsState state) {
        if (state is DepartmentsLoaded) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              BringTheCool(
                departments: state.departments,
              ),
            ],
          );
        }

        return Container();
      },
    );
  }
}
