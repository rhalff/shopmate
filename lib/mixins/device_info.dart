import 'package:flutter/widgets.dart';

mixin DeviceInfoMixin<T extends StatefulWidget> on State<T> {
  bool get isLargeScreen {
    return MediaQuery.of(context).size.width > 600;
  }
}
