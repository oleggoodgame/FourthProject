
import 'package:flutter/material.dart';
import 'package:four/TicTacToeLogic.dart';
import 'package:four/oneWbot_screen.dart';
import 'package:four/twoWtwo_screen.dart';

void main() {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: const MainPage());
  }
}

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  var activeScreen = "main-screen";

  void switchOne() {
    setState(() {
      activeScreen = "bot-screen";
    });
  }

  void switchTwo() {
    setState(() {
      activeScreen = "play-screen";
    });
  }

  @override
  Widget build(BuildContext context) {
    Widget screenWidget;

    if (activeScreen == "bot-screen") {
      screenWidget = const TicTacToeBot();
    } else if (activeScreen == "play-screen") {
      screenWidget = const TicTacToe();
    } else {
      screenWidget = MainScreen(
        startBotGame: switchOne,
        startTwoPlayerGame: switchTwo,
      );
    }

    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(color: Colors.deepPurple),
        child: Center(child: screenWidget),
      ),
    );
  }
}

class MainScreen extends StatelessWidget {
  const MainScreen({
    super.key,
    required this.startBotGame,
    required this.startTwoPlayerGame,
  });

  final void Function() startBotGame;
  final void Function() startTwoPlayerGame;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurple,
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            BigText("Tic-Tac-Toe game!"),
            ElevatedButton(
              onPressed: startBotGame,
              child: const Text('Play vs Bot'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: startTwoPlayerGame,
              child: const Text('Play 2 Player'),
            ),
          ],
        ),
      ),
    );
  }
}
// class TicTacToe extends StatefulWidget {
//   const TicTacToe({super.key});

//   @override
//   State<TicTacToe> createState() => _TicTacToeState();
// }

// class _TicTacToeState extends State<TicTacToe> {
//   int index = 0;
//   List<String> board = List.filled(8, '');
//   String textWin = "";
//   bool fifi = true;
//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       mainAxisAlignment: MainAxisAlignment.center,
//       children: [
//         Center(child: Text("$textWin")),
//         SizedBox(height: 30),
//         buildRow(0), 
//         horizontalDivider(),
//         buildRow(3),
//         horizontalDivider(),
//         buildRow(6),
//       ],
//     );
//   }

//   Widget buildRow(int startIndex) {
//     return Row(
//       mainAxisAlignment: MainAxisAlignment.center,
//       children: [
//         buildButton(startIndex),
//         verticalDivider(),
//         buildButton(startIndex + 1),
//         verticalDivider(),
//         buildButton(startIndex + 2),
//       ],
//     );
//   }

//   Widget buildButton(int index) {
//     return SizedBox(
//       width: 100,
//       height: 100,
//       child: TextButton(
//         onPressed: () {
//           changeAction(index);
//           victoryCheck();
//         },
//         child: Text(
//           board[index],
//           style: TextStyle(fontSize: 32, color: Colors.white),
//         ),
//       ),
//     );
//   }

//   Widget verticalDivider() {
//     return Container(width: 2, height: 100, color: Colors.black);
//   }

//   Widget horizontalDivider() {
//     return Container(width: 300, height: 2, color: Colors.black);
//   }

//   void changeAction(int index) {
//     setState(() {
//       if (textWin != "") return;

//       if (board[index] == '') {
//         board[index] = fifi ? 'X' : 'O';
//         fifi = !fifi;
//       }
//     });
//   }

//   void victoryCheck() {
//     for (int i = 0; i < 9; i += 3) {
//       if (board[i] != '' &&
//           board[i] == board[i + 1] &&
//           board[i + 1] == board[i + 2] &&
//           board[i] == board[i + 2]) {
//         setState(() {
//           textWin = "WIN ${board[i]}";
//         });
//       }
//     }
//     for (int i = 0; i < 3; i++) {
//       if (board[i] != '' &&
//           board[i] == board[i + 3] &&
//           board[i + 3] == board[i + 6] &&
//           board[i] == board[i + 6]) {
//         setState(() {
//           textWin = "WIN ${board[i]}";
//         });
//       }
//     }
//     if (board[0] != '' && board[0] == board[4] && board[4] == board[8]) {
//       setState(() {
//         textWin = "WIN ${board[0]}";
//       });
//     }

//     if (board[2] != '' && board[2] == board[4] && board[4] == board[6]) {
//       setState(() {
//         textWin = "WIN ${board[2]}";
//       });
//     }
    
//   }
// }
