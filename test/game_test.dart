import 'package:flutter_test/flutter_test.dart';
import 'package:foxo/game.dart';
import 'package:foxo/enums.dart';

void main() {
  test('initializes state', () {
    final game = Game();
    expect(game.state, [
      CellType.empty,
      CellType.empty,
      CellType.empty,
      CellType.empty,
      CellType.empty,
      CellType.empty,
      CellType.empty,
      CellType.empty,
      CellType.empty,
    ]);
  });

  test('finding a winner', () {
    final game = Game();
    game.state[0] = CellType.foxo;
    game.state[1] = CellType.foxo;
    game.state[2] = CellType.foxo;
    expect(game.winner([0, 1, 2]), true);
  });

  test('finding the game state when foxo wins', () {
    final game = Game();
    game.state[0] = CellType.foxo;
    game.state[1] = CellType.foxo;
    game.state[2] = CellType.foxo;
    expect(game.findGameState(), CellType.foxo);
  });

  test('finding the game state when chick wins', () {
    final game = Game();
    game.state[0] = CellType.chick;
    game.state[1] = CellType.chick;
    game.state[2] = CellType.chick;
    expect(game.findGameState(), CellType.chick);
  });

  test('finding the game state when the game is still in progress', () {
    final game = Game();
    expect(game.findGameState(), null);
  });

  test('finding the game state when it is a tie', () {
    final game = Game();
    game.state = [
      CellType.foxo,
      CellType.foxo,
      CellType.chick,
      CellType.chick,
      CellType.chick,
      CellType.foxo,
      CellType.foxo,
      CellType.foxo,
      CellType.chick,
    ];
    expect(game.findGameState(), CellType.empty);
  });

  test('the minimax algorithm', () {
    final game = Game();
    game.state[0] = CellType.chick;
    expect(game.minimax(0, CellType.foxo), 4);
  });
}
