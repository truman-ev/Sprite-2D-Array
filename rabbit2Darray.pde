int cols = 6;  // Number of columns
int rows = 5;  // Number of rows
Sprite[][] sprites; // 2D array of sprites

int numFrames = 9;  // Number of animation frames
PImage[] spriteFrames; // Array to hold sprite images
int frameDelay = 20;  // Speed of animation (higher = slower)

void setup() {
  size(500, 500);
  loadSpriteFrames();  // Load sprite images
  sprites = new Sprite[cols][rows];

  // Initialize the sprites in a grid layout
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
  
  // Update and display the sprites
  for (int i = 0; i < cols; i++) {
    for (int j = 0; j < rows; j++) {
      sprites[i][j].update();
      sprites[i][j].display();
    }
  }
}

// Function to load sprite frames
void loadSpriteFrames() {
  spriteFrames = new PImage[numFrames];
  for (int i = 0; i < numFrames; i++) {
    spriteFrames[i] = loadImage("rabbit" + i + ".png"); // Ensure images are named rabbit0.png, rabbit1.png, etc.
  }
}

// Sprite Class
class Sprite {
  float x, y;
  int currentFrame = 0;
  int frameCount = 0;
  float size = 50; // Size of the sprite
  float speedX = 1; // Speed of movement along x-axis

  Sprite(float x, float y) {
    this.x = x;
    this.y = y;
  }


  void update() {
    // Update animation frame
    frameCount++;
    if (frameCount % frameDelay == 0) {
        currentFrame = (currentFrame + 1) % numFrames;
    }

    // Move sprite to the right
    x += speedX;

    // Seamless wrapping: If the first column moves off-screen, shift all sprites back
    if (x >= width) {
        x -= width;  // Shift left by one full width to prevent gaps
    }
}

  void display() {
  

    image(spriteFrames[currentFrame], x - size / 2, y - size / 2, size, size);
  }
}
