import 'package:flutter/material.dart';
import 'package:shopmate/widgets/widgets.dart';

class BottomButton extends BottomNavigationBarItem {
  BottomButton({
    @required Icon icon,
    String title,
    TextStyle style,
  })  : assert(icon != null),
        super(
          backgroundColor: Colors.transparent,
          icon: icon,
          title: BorderedText(
            strokeWidth: 2,
            child: title != null
                ? Text(
                    title,
                    style: style,
                  )
                : null,
          ),
        );
}
