import 'package:flutter/material.dart'; 
import 'package:four/TicTacToeLogic.dart';

class TicTacToe extends StatefulWidget {
  const TicTacToe({super.key});

  @override
  State<TicTacToe> createState() => _TicTacToeState();
}

class _TicTacToeState extends State<TicTacToe> {
  final logic = TicTacToeLogic();
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Center(child: BigText("${logic.textWin}")),
        SizedBox(height: 30),
        buildRow(0), 
        horizontalDivider(),
        buildRow(3),
        horizontalDivider(),
        buildRow(6),
        SizedBox(height: 30,),
        RestartButton(restart),
      ],
    );
  }

  Widget buildRow(int startIndex) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        buildButton(startIndex),
        verticalDivider(),
        buildButton(startIndex + 1),
        verticalDivider(),
        buildButton(startIndex + 2),
      ],
    );
  }

  Widget buildButton(int index) {
    return SizedBox(
      width: 100,
      height: 100,
      child: TextButton(
        onPressed: () {
          onTap(index);
          logic.victoryCheck();
        },
        child: Text(
          logic.board[index],
          style: TextStyle(fontSize: 32, color: Colors.white),
        ),
      ),
    );
  }

  Widget verticalDivider() {
    return Container(width: 2, height: 100, color: Colors.black);
  }

  Widget horizontalDivider() {
    return Container(width: 300, height: 2, color: Colors.black);
  }

  void onTap(int index) {
  setState(() {
    logic.changeAction(index);
    logic.victoryCheck();

    if (logic.textWin == '' && logic.fifi == false) {
      logic.victoryCheck();
    }
  });
}
  void restart(){
    setState(() {
    logic.restartGame();
    });
  }

  
}
