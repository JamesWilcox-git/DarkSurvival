float noiseScale = 0.02; // Adjust this value to change the scale of the noise
int rows = 400; // Number of rows in the noise map
int cols = 400; // Number of columns in the noise map

void setup() {
  size(400, 400);
  //noiseSeed(42); // Optional: Set a seed for reproducibility
}

void BiomeColor(float val) {
  if (val >= 0 && val <= 255) {
    float normalizedVal = map(val, 0, 255, 0, 1); // Map val to a range between 0 and 1
    
    if (normalizedVal < 0.1) { // Less than 0.1 (less than 25 in the range 0-255)
      stroke(0, 0, 100); // Darker blue
    } else if (normalizedVal < 0.2) { // Between 0.1 and 0.2 (between 25 and 50 in the range 0-255)
      stroke(0, 0, 175); // Blue
    } else if (normalizedVal < 0.3) { // Between 0.2 and 0.3 (between 50 and 75 in the range 0-255)
      stroke(7, 98, 200); // Dark blue
    } else if (normalizedVal < 0.4) { // Between 0.3 and 0.4 (between 75 and 100 in the range 0-255)
      stroke(3, 161, 250); // Light blue
    } else if (normalizedVal < 0.5) { // Between 0.4 and 0.5 (between 100 and 127.5 in the range 0-255)
      stroke(240, 230, 140); // Sand color
    } else if (normalizedVal < 0.6) { // Between 0.5 and 0.6 (between 127.5 and 153 in the range 0-255)
      stroke(34, 139, 34); // Green grass
    } else if (normalizedVal < 0.8) { // Between 0.6 and 0.8 (between 153 and 204 in the range 0-255)
      stroke(100); // Dark grey
    } else { // Greater than 0.8 (greater than 204 in the range 0-255)
      stroke(255); // White (snow on top of mountains)
    }
  }
}


void draw() {
  background(255);
  
  // Generate and display the noise map
  for (int y = 0; y < rows; y++) {
    for (int x = 0; x < cols; x++) {
      float noiseValue = noise(x * noiseScale, y * noiseScale);
      int val = int(noiseValue * 255);
      BiomeColor(val);
      point(x, y);
    }
  }
}






/*
Chunk map1 = new Chunk();

void setup(){
  size(400,400);
  background(#9c8d7e);
}

class Chunk {
  //int[][] chunkLocations;
  int[][] chunkBlocks;
  
  Chunk(){
    chunkBlocks = new int[100][100];
  }
  
  void display(){
    for (int i = 0; i < 100; i++) {
      for (int j = 0; j < 100; j++) {
        fill(random(255),random(255),random(255));
        square(i*11, j*11, 10);
      }
    }
  }
  
}

void draw(){
  map1.display();
}
*/
