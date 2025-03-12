/* Your Name, Date, Learning Goal */
// Add a comment to each "//" that you see. 
int cols = 6;  // 
int rows = 5;  // 
Sprite[][] sprites; // 

int numFrames = 9;  // 
PImage[] spriteFrames; // 
int frameDelay = 20;  // Speed of animation (higher = slower)

void setup() {
  size(500, 500);
  loadSpriteFrames();  //
  sprites = new Sprite[cols][rows];

  // 

  for (int i = 0; i < cols; i++) {
    for (int j = 0; j < rows; j++) {
      float x = i * width / cols + width / (cols * 2);
      float y = j * height / rows + height / (rows * 2);
      sprites[i][j] = new Sprite(x, y);
    }
  }
}

void draw() {
  background(0);
  
  // 
  for (int i = 0; i < cols; i++) {
    for (int j = 0; j < rows; j++) {
      sprites[i][j].update();
      sprites[i][j].display();
    }
  }
}

// 
void loadSpriteFrames() {
  spriteFrames = new PImage[numFrames];
  for (int i = 0; i < numFrames; i++) {
    spriteFrames[i] = loadImage("rabbit" + i + ".png"); // Ensure images are named _____0.png, _____1.png, etc.
  }
}

// Sprite Class
class Sprite {
  float x, y;
  int currentFrame = 0;
  int frameCount = 0;
  float size = 50; // 
  float speedX = 0.75; // 

  Sprite(float x, float y) {
    this.x = x;
    this.y = y;
  }


  void update() {
    // 
    frameCount++;
    if (frameCount % frameDelay == 0) {
        currentFrame = (currentFrame + 1) % numFrames;
    }

    // 
    x += speedX;

    // 
    if (x >= width) {
        x -= width;  // Shift left by one full width to prevent gaps
    }
}

  void display() {
  

    image(spriteFrames[currentFrame], x - size / 2, y - size / 2, size, size);
  }
}
