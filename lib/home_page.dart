import 'dart:math';

import 'package:card_flipper/reset_button.dart';
import 'package:flutter/material.dart';
import 'package:page_flip_builder/page_flip_builder.dart';

import 'game_card.dart';

enum GameStatus {
  playing,
  notPlaying,
  restarting,
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _flipKey0 = GlobalKey<PageFlipBuilderState>();

  final _flipKey1 = GlobalKey<PageFlipBuilderState>();

  static final _rng = Random();
  //static const cardFlipDuration = Duration(milliseconds: 350);
  final int _targetIndex = _rng.nextInt(2);

  GameStatus _gameStatus = GameStatus.playing;
  bool _didWin = false;

  void _completeGame(bool didWin) {
    setState(() {
      _didWin = didWin;
      _gameStatus = GameStatus.notPlaying;
    });
  }

  tryAgain() {
    setState(() {
      _gameStatus = GameStatus.restarting;
    });
    if (_didWin && _targetIndex == 00 || !_didWin && _targetIndex == 1) {
      _flipKey0.currentState?.flip();
    } else {
      _flipKey1.currentState?.flip();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        GameCard(
          flipKey: _flipKey0,
          hasFlutterLogo: _targetIndex == 0,
          canFlip: _gameStatus == GameStatus.playing,
          onFlip: (value) {
            if (!value) {
              _completeGame(_targetIndex == 0);
            }
          },
        ),
        GameCard(
          flipKey: _flipKey1,
          hasFlutterLogo: _targetIndex == 1,
          canFlip: _gameStatus == GameStatus.playing,
          onFlip: (value) {
            if (!value) {
              _completeGame(_targetIndex == 1);
            }
          },
        ),
        ResetButton(result: _didWin, gameStatus: _gameStatus, reset: tryAgain)
      ],
    );
  }
}
