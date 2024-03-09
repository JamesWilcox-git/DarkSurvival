int tileSize = 10; // Define tileSize variable
int renderSize = 1000; // Define the size of the rendered area around the player
int initialViewRadius = 30;

Terrain terrain;
Player player;

void settings() {
  size(600, 600); // Set a smaller window size
}

void setup() {
  terrain = new Terrain(0.02, tileSize, renderSize, renderSize, 400, 400, initialViewRadius); // Set view radius to 8 pixels
  player = new Player(renderSize / 2, renderSize / 2, tileSize); // Start player at the center of the rendered area
  noStroke();
}

void draw() {
  background(23, 30, 69); // Set background to black
  translate(width / 2 - player.playerX, height / 2 - player.playerY); // Translate to center the player on screen
  terrain.draw(player.playerX / tileSize, player.playerY / tileSize);
  player.draw();
}

void keyPressed() {
  player.updatePosition(keyCode, renderSize, renderSize);
}
