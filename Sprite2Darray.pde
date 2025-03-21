/* 
Truman Evans
3/21/2025
Modify an existing program to customize a grid-based structure, practicing use of object-oriented programming and 2D array structure and syntax. 
Document code with comments and create a simple HTML page to embed their Processing sketch and caption it, reinforcing both programming and web development skills.
*/
// Add a comment to each "//" that you see. 
int cols = 12;  // initializing columns variable, 6 columns
int rows = 11;  // initializing rows variable, 5 rows
Sprite[][] sprites; // declaring a 2d array 'sprites' for sprites

int numFrames = 8;  // initialzing frames variable, # of frames in sprite
PImage[] spriteFrames; // declaring the image variable for sprite
int frameDelay = 10;  // Speed of animation (higher = slower)

void setup() {
  size(500, 500);
  loadSpriteFrames();  // calling upon the loadSpriteFrames method, loading the sprite frames, but not displaying anything
  sprites = new Sprite[cols][rows]; // initialzing 2d array

  // iterating through 2d array, assigning a sprite to each element

  for (int i = 0; i < cols; i++) {
    for (int j = 0; j < rows; j++) {
      float x = i * (width+100) / cols + width / (cols * 2);         //adjusted so that the width is wider, getting rid of gaps
      float y = j * height / rows + height / (rows * 2);
      sprites[i][j] = new Sprite(x, y);
    }
  }
}

void draw() {
  background(255);
  
  // iterating through 2d array, updating and displaying sprites
  for (int i = 0; i < cols; i++) {
    for (int j = 0; j < rows; j++) {
      sprites[i][j].update();
      sprites[i][j].display();
    }
  }
}

// loading in the sprites, frame by frame
void loadSpriteFrames() {
  spriteFrames = new PImage[numFrames];
  for (int i = 0; i < numFrames; i++) {
    spriteFrames[i] = loadImage("sprite_" + i + ".png"); // Ensure images are named _____0.png, _____1.png, etc.
  }
} 

// Sprite Class
class Sprite {
  float x = -50;
  float y;
  int currentFrame = 0;
  int frameCount = 0;
  float size = 50; // size of sprites
  float speedX = 0.75; // speed of sprites moving across the x axis

  Sprite(float x, float y) {
    this.x = x;
    this.y = y;
  }


  void update() {
    // iterating through the frames, updating one frame at a time
    frameCount++;
    if (frameCount % frameDelay == 0) {
        currentFrame = (currentFrame + 1) % numFrames;
    }

    // moves the sprite across the x axis
    x += speedX;

    // loops sprite position back to start when sprite reaches the end, keeps the sprites on screen.
    if (x >= width+50) {                                                                                  //adjusted so sprites are not cut off, transition is smooth
        x -= width+100;  // Shift left by one full width to prevent gaps     
    }
}

  void display() {
  

    image(spriteFrames[currentFrame], x - size / 2, y - size / 2, size, size);  
  }
}
