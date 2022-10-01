// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:card_flipper/game_card_side.dart';
import 'package:flutter/material.dart';
import 'package:page_flip_builder/page_flip_builder.dart';

class GameCard extends StatelessWidget {
  final GlobalKey<PageFlipBuilderState> flipKey;
  final bool canFlip;
  final bool hasFlutterLogo;
  ValueChanged<bool>? onFlip;

  GameCard({
    Key? key,
    required this.flipKey,
    required this.canFlip,
    required this.hasFlutterLogo,
    this.onFlip,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PageFlipBuilder(
      key: flipKey,
      frontBuilder: (context) => GameCardSide(
          color: Colors.yellow,
          onPressed: (() {
            flipKey.currentState?.flip();
          }),
          child: const Text('?')),
      backBuilder: (context) => GameCardSide(
          color: Colors.white,
          child: hasFlutterLogo ? const FlutterLogo() : Container()),
      onFlipComplete: onFlip,
    );
  }
}
