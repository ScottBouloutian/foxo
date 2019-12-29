import 'enums.dart';
import 'dart:math';

class Game {
  List<CellType> state;

  Game(bool moveFoxo) {
    state = List.generate(9, (index) => CellType.empty);
    if (moveFoxo) {
      final moves = [0, 2, 6, 8];
      final random = Random();
      final index = random.nextInt(moves.length);
      state[moves[index]] = CellType.foxo;
    }
  }

  bool winner(List<int> line) {
    final first = state[line[0]];
    return (
      (first != CellType.empty)
      && line.map((value) => state[value]).every((value) => value == first)
    );
  }

  List<int> findWinningLine() {
    final List<List<int>> lines = [
      [0, 1, 2], [3, 4, 5], [6, 7, 8],
      [0, 3, 6], [1, 4, 7], [2, 5, 8],
      [0, 4, 8], [2, 4, 6],
    ];
    // Check all possible win paths
    return lines.firstWhere(
      (line) => winner(line),
      orElse: () => null,
    );
  }

  CellType findGameState() {
    final winningLine = findWinningLine();
    if (winningLine != null) {
      return state[winningLine[0]];
    }
    // Check if game is in progress
    final inProgress = state.any((cell) => cell == CellType.empty);
    if (inProgress) {
      return null;
    }
    return CellType.empty;
  }

  // Performs an optimized minimax search algorithm
  int minimax(int depth, CellType player) {
    // Return in the case of a terminal state
    final gameState = findGameState();
    final factor = player == CellType.foxo ? 1 : -1;
    switch(gameState) {
      case CellType.chick:
        return (depth - 100) * factor;
      case CellType.foxo:
        return (100 - depth) * factor;
      case CellType.empty:
        return 0;
    }
    // Perform the search
    int value;
    int bestValue = -999;
    List<int> bestMoves = [];
    state.asMap().forEach((index, cell) {
      if (cell == CellType.empty) {
        final nextPlayer = player == CellType.foxo ? CellType.chick : CellType.foxo;
        state[index] = player;
        value = -minimax(depth + 1, nextPlayer);
        state[index] = CellType.empty;
        if (value > bestValue) {
          bestValue = value;
          bestMoves = [index];
        } else if (value == bestValue) {
          bestMoves.add(index);
        }
      }
    });
    if (depth == 0) {
      final random = Random();
      final index = random.nextInt(bestMoves.length);
      return bestMoves[index];
    }
    return bestValue;
  }
}
