import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopmate/features/catalog/blocs/blocs.dart';
import 'package:shopmate/features/department/screens/screens.dart';
import 'package:shopmate/navigation/top_navigation.dart';
import 'package:shopmate/widgets/widgets.dart';

class DepartmentNavigation extends StatefulWidget {
  @override
  _DepartmentNavigationState createState() => _DepartmentNavigationState();
}

class _DepartmentNavigationState extends State<DepartmentNavigation> {
  DepartmentsBloc _departmentsBloc;
  @override
  void initState() {
    super.initState();
    _departmentsBloc = BlocProvider.of<DepartmentsBloc>(context);
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder(
      bloc: _departmentsBloc,
      builder: (BuildContext context, DepartmentsState state) {
        if (state is DepartmentsLoaded) {
          return TopNavigation(
            items: _buildItems(state),
          );
        }

        return Container();
      },
    );
  }

  List<LinkItem> _buildItems(DepartmentsLoaded state) {
    return state.departments.map((department) {
      return LinkItem(
        title: department.name,
        route: DepartmentScreen.route,
        arguments: {'department': department},
      );
    }).toList();
  }
}
