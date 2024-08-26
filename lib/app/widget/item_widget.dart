import 'package:flutter/material.dart';
import 'package:technical_test_fast8/app/model/menu/menu_model.dart';

class MenuItemWidget extends StatelessWidget {
  final MenuItem menuItem;

  MenuItemWidget({required this.menuItem});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          menuItem.icon,
          size: 30,
          color: menuItem.color,
        ),
        const SizedBox(height: 8),
        Center(
            child: Text(
          menuItem.title,
          textAlign: TextAlign.center,
        )),
      ],
    );
  }
}
