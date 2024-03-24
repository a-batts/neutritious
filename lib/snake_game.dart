import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:math';

class SnakeGameWidget extends StatefulWidget {
  @override
  _SnakeGameWidgetState createState() => _SnakeGameWidgetState();
}

class _SnakeGameWidgetState extends State<SnakeGameWidget> {
  static const int gridSize = 20;
  static const double cellSize = 20.0;

  List<int> snake = [45, 44, 43];
  int food = Random().nextInt(gridSize * gridSize);

  Direction direction = Direction.right;
  bool isPlaying = false;
  bool gameOver = false;
  int score = 0;
  int speed = 300;

  @override
  void initState() {
    super.initState();
  }

  void startGame() {
    const duration = Duration(milliseconds: 300);
    snake = [45, 44, 43];
    score = 0;
    direction = Direction.right;
    isPlaying = true;
    gameOver = false;
    speed = 300;
    Timer.periodic(Duration(milliseconds: speed), (Timer timer) {
      if (!isPlaying) {
        timer.cancel();
      }
      moveSnake();
      if (checkCollision()) {
        setState(() {
          isPlaying = false;
          gameOver = true;
        });
        timer.cancel();
      }
    });
  }

  void moveSnake() {
    setState(() {
      switch (direction) {
        case Direction.up:
          if (snake.first < gridSize) {
            setState(() {
              isPlaying = false;
              gameOver = true;
            });
            return;
          }
          snake.insert(0, snake.first - gridSize);
          break;
        case Direction.down:
          if (snake.first >= (gridSize * (gridSize - 1))) {
            setState(() {
              isPlaying = false;
              gameOver = true;
            });
            return;
          }
          snake.insert(0, snake.first + gridSize);
          break;
        case Direction.left:
          if (snake.first % gridSize == 0) {
            setState(() {
              isPlaying = false;
              gameOver = true;
            });
            return;
          }
          snake.insert(0, snake.first - 1);
          break;
        case Direction.right:
          if ((snake.first + 1) % gridSize == 0) {
            setState(() {
              isPlaying = false;
              gameOver = true;
            });
            return;
          }
          snake.insert(0, snake.first + 1);
          break;
      }
      if (snake.first == food) {
        score += 10;
        generateFood();
        speed -= 10;
        if (speed < 100) speed = 100; // Limit speed increase
      } else {
        snake.removeLast();
      }
    });
  }

  void generateFood() {
    food = Random().nextInt(gridSize * gridSize);
    while (snake.contains(food)) {
      food = Random().nextInt(gridSize * gridSize);
    }
    speed -= 10; // Increase speed
    if (speed < 100) speed = 100; // Limit speed increase
  }

  bool checkCollision() {
    if (snake.first < 0 ||
        snake.first >= gridSize * gridSize ||
        snake.sublist(1).contains(snake.first)) {
      return true;
    }
    return false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Snake Game'),
      ),
      body: isPlaying
          ? Center(
              child: GestureDetector(
                onTap: () {
                  if (!isPlaying) {
                    setState(() {
                      startGame();
                    });
                  }
                },
                onVerticalDragUpdate: (details) {
                  if (direction != Direction.up && details.delta.dy > 0) {
                    direction = Direction.down;
                  } else if (direction != Direction.down && details.delta.dy < 0) {
                    direction = Direction.up;
                  }
                },
                onHorizontalDragUpdate: (details) {
                  if (direction != Direction.left && details.delta.dx > 0) {
                    direction = Direction.right;
                  } else if (direction != Direction.right && details.delta.dx < 0) {
                    direction = Direction.left;
                  }
                },
                child: AspectRatio(
                  aspectRatio: 1.0,
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey),
                    ),
                    child: GridView.builder(
                      physics: NeverScrollableScrollPhysics(),
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: gridSize,
                      ),
                      itemCount: gridSize * gridSize,
                      itemBuilder: (BuildContext context, int index) {
                        if (snake.contains(index)) {
                          return Center(
                            child: Container(
                              padding: EdgeInsets.all(2),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(5),
                                child: Container(
                                  color: Colors.green,
                                ),
                              ),
                            ),
                          );
                        }
                        if (index == food) {
                          return Center(
                            child: Container(
                              padding: EdgeInsets.all(2),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(5),
                                child: Container(
                                  color: Colors.red,
                                ),
                              ),
                            ),
                          );
                        }
                        return Container();
                      },
                    ),
                  ),
                ),
              ),
            )
          : Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Snake Game',
                    style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        startGame();
                      });
                    },
                    child: Text('Start Game'),
                  ),
                ],
              ),
            ),
      bottomNavigationBar: BottomAppBar(
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Score: $score',
                style: TextStyle(fontSize: 18),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

enum Direction { up, down, left, right }
