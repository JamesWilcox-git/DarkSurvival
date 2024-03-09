class Player {
  int playerX, playerY;
  int tileSize;

  Player(int playerX, int playerY, int tileSize) {
    this.playerX = playerX;
    this.playerY = playerY;
    this.tileSize = tileSize;
  }

  void draw() {
    fill(255, 0, 0);
    rect(playerX, playerY, tileSize, tileSize);
  }

  void updatePosition(int keyCode, int screenWidth, int screenHeight) {
    int newX = playerX, newY = playerY;
    if (keyCode == UP && playerY > 0) {
      newY -= tileSize;
    } else if (keyCode == DOWN && playerY < screenHeight - tileSize) {
      newY += tileSize;
    } else if (keyCode == LEFT && playerX > 0) {
      newX -= tileSize;
    } else if (keyCode == RIGHT && playerX < screenWidth - tileSize) {
      newX += tileSize;
    }
    // Update position only if it's within the screen boundaries
    if (newX >= 0 && newX < screenWidth && newY >= 0 && newY < screenHeight) {
      playerX = newX;
      playerY = newY;
    }
  }
}
