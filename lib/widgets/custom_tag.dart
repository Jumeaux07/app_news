import 'package:flutter/material.dart';

class CustomTag extends StatelessWidget {
  const CustomTag({ Key key, @required this.backgrounColor, @required this.children }) : super(key: key);
  final Color backgrounColor;
  final List<Widget> children;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: backgrounColor,
        borderRadius: BorderRadius.circular(20.20)
      ),
      padding: EdgeInsets.all(10.0),
      child: Row(
        children: children,
        mainAxisSize: MainAxisSize.min,
      ),
    );
  }
}