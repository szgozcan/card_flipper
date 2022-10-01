// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:flutter/material.dart';

import 'package:card_flipper/home_page.dart';

class ResetButton extends StatelessWidget {
  final bool result;
  final GameStatus gameStatus;
  final VoidCallback reset;
  const ResetButton({
    Key? key,
    required this.result,
    required this.gameStatus,
    required this.reset,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(result ? 'You Won' : 'You Lost'),
        TextButton(onPressed: reset, child: const Text('Try Again'))
      ],
    );
  }
}
