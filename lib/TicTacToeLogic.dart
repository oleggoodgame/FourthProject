import 'dart:math';

import 'package:flutter/material.dart'; 

class TicTacToeLogic {
  List<String> board = List.filled(9, '');
  String textWin = '';
  bool fifi = true;
  final randomizer = Random();

  void changeAction(int index) {
    if (textWin != '') return;
    if (board[index] == '') {
      board[index] = fifi ? 'X' : 'O';
      fifi = !fifi;
    }
  }

  void victoryCheck() {
    for (int i = 0; i < 9; i += 3) {
      if (board[i] != '' &&
          board[i] == board[i + 1] &&
          board[i + 1] == board[i + 2] &&
          board[i] == board[i + 2]) {
          textWin = "WIN ${board[i]}";
      }
    }
    for (int i = 0; i < 3; i++) {
      if (board[i] != '' &&
          board[i] == board[i + 3] &&
          board[i + 3] == board[i + 6] &&
          board[i] == board[i + 6]) {
          textWin = "WIN ${board[i]}";
      }
    }
    if (board[0] != '' && board[0] == board[4] && board[4] == board[8]) {
        textWin = "WIN ${board[0]}";
    }

    if (board[2] != '' && board[2] == board[4] && board[4] == board[6]) {
        textWin = "WIN ${board[2]}";
    }
    
  }
  
  void botMove() {
    fifi = !fifi;
    if (board[5] == '') {
      board[5] = 'O';
      
    }
    else{
    int newRoll;
    do {
      newRoll = randomizer.nextInt(9);
    } while (board[newRoll] != '');

    board[newRoll] = 'O';
    }
  }

  void restartGame(){
    board = List.filled(9, '');
    fifi = true;
    textWin = '';
  }
}


class BigText extends StatelessWidget {
  final String text;
  final double? fontsize;
  const BigText(this.text, {this.fontsize, super.key});
  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(fontSize: fontsize ?? 28, color: Colors.white),
    );
  }

  BigText copyWith(double fontsize) {
    return BigText(text, fontsize: fontsize);
  }
}

class RestartButton extends StatelessWidget {
  const RestartButton(this.restartgame, {super.key});
  final void Function() restartgame;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(onPressed: restartgame, child: BigText("RESTART").copyWith(20));
  }

}