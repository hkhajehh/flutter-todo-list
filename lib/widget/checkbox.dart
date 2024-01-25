import 'package:flutter/material.dart';
import 'package:todo/main.dart';

class TodoCheckBox extends StatelessWidget {
  final bool value;
  final GestureTapCallback onTap;

  const TodoCheckBox({super.key, required this.value, required this.onTap});
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: 24,
        height: 24,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(7),
            border:
                !value ? Border.all(color: secondaryTextColor, width: 1) : null,
            color: value ? Color(0xffFEEECA) : null),
        child: value
            ? Icon(
                Icons.check,
                size: 18,
                color: Color(0xff070709),
              )
            : null,
      ),
    );
  }
}
