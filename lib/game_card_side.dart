// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:flutter/material.dart';

class GameCardSide extends StatelessWidget {
  final Color color;
  final VoidCallback? onPressed;
  final Widget child;
  const GameCardSide({
    Key? key,
    required this.color,
    this.onPressed,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        width: 200,
        height: 200,
        color: color,
        child: child,
      ),
    );
  }
}
