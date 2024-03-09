class Terrain {
  float noiseScale;
  int tileSize;
  int screenWidth, screenHeight;
  int mapWidth, mapHeight;
  int xOffset, yOffset;
  int[][] terrainMap;
  int viewRadius;

  Terrain(float noiseScale, int tileSize, int screenWidth, int screenHeight, int mapWidth, int mapHeight, int viewRadius) {
    this.noiseScale = noiseScale;
    this.tileSize = tileSize;
    this.screenWidth = screenWidth;
    this.screenHeight = screenHeight;
    this.mapWidth = mapWidth;
    this.mapHeight = mapHeight;
    this.terrainMap = new int[mapHeight][mapWidth];
    this.viewRadius = viewRadius;
    generateTerrain();
  }

  void generateTerrain() {
    for (int y = 0; y < mapHeight; y++) {
      for (int x = 0; x < mapWidth; x++) {
        float noiseValue = noise(x * noiseScale, y * noiseScale);
        terrainMap[y][x] = int(noiseValue * 255);
      }
    }
  }

  void draw(int playerX, int playerY) {
    for (int y = 0; y < screenHeight / tileSize; y++) {
      for (int x = 0; x < screenWidth / tileSize; x++) {
        int tileX = x + xOffset;
        int tileY = y + yOffset;
        int distSq = (tileX - playerX) * (tileX - playerX) + (tileY - playerY) * (tileY - playerY);
        if (distSq <= viewRadius * viewRadius) {
          if (tileX >= 0 && tileX < mapWidth && tileY >= 0 && tileY < mapHeight) {
            int val = terrainMap[tileY][tileX];
            drawTile(val, x * tileSize, y * tileSize);
          }
        } else {
          fill(0); // Fill with black color
          rect(x * tileSize, y * tileSize, tileSize, tileSize);
        }
      }
    }
  }

  void drawTile(int val, int x, int y) {
    if (val >= 0 && val <= 255) {
      float normalizedVal = map(val, 0, 255, 0, 1);
      if (normalizedVal < 0.1) fill(0, 0, 100);
      else if (normalizedVal < 0.2) fill(0, 0, 175);
      else if (normalizedVal < 0.3) fill(7, 98, 200);
      else if (normalizedVal < 0.4) fill(3, 161, 250);
      else if (normalizedVal < 0.5) fill(240, 230, 140);
      else if (normalizedVal < 0.6) fill(34, 139, 34);
      else if (normalizedVal < 0.8) fill(100);
      else fill(255);
      rect(x, y, tileSize, tileSize);
    }
  }
}
