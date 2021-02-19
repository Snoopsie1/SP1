// If the game has an error on startup try these following steps:
// - Press 'Sketch'
// - Press 'Import Library'
// - Press 'Add Library'
// - Find and download the Sound library, made by The Processing Foundation.
import processing.sound.*;
SoundFile file;
SoundFile file2;
SoundFile file3;
SoundFile file4;

int size = 40;
int[][] grid = new int[13][13]; //grid is 13,13 so I have room for GUI and visual score tracker.
PImage gameOver;
PImage beegBiver;
PFont font;

Player player;
Enemy enemy;
Food food;

void setup()
{
  size(600, 600);
  frameRate(60);
  gameOver = loadImage("MadPixelBiver.png");
  beegBiver = loadImage("BeegPixelBiver.png");
  font = createFont("rainyhearts.ttf", 80, true);
  textFont(font);
  file = new SoundFile(this, "Dogbass.mp3");
  file2 = new SoundFile(this, "FoodPickup.mp3");
  file3 = new SoundFile(this, "VictoryScreen.mp3");
  file4 = new SoundFile(this, "GameMusic.mp3");

  player = new Player(100, 100, 30);
  enemy = new Enemy(500, 100, player);
  food = new Food(250, 250, player);

  // Game Music
  gameJam();
}

void draw()
{
  clearBoard();
  drawBoard();

  updateEntities();
}

void clearBoard()
{
  for (int x = 0; x < grid.length; x++)
  {
    for (int y = 0; y < grid[0].length; y++)
    {
      grid[x][y] = 0;
    }
  }
}

void drawBoard()
{
  background(0);
  for (int x = 2; x < grid.length; x++)
  {
    for (int y = 2; y < grid[0].length; y++)
    {
      fill(0);
      stroke(255);
      rect(x * size, y * size, size, size);
    }
  }
  //Heart images, displaying based on player.health
  if (player.health >= 20)
  {
    image(player.hp, 220, 40, -60, -60);
  }
  if (player.health >= 10)
  {
    image(player.hp, 160, 40, -60, -60);
  }
  if (player.health > 0)
  {
    image(player.hp, 100, 40, -60, -60);
  }

  fill(246, 64, 79);
  textSize(50);
  text("Biver", 420, 60);
}

void playerWallCollision()
{
  if (player.x <= 100)
  {
    player.x = 100;
  }
  if (player.x >= width-100)
  {
    player.x = width-100;
  }
  if (player.y <= 100)
  {
    player.y = 100;
  }
  if (player.y >= height-100)
  {
    player.y = height-100;
  }
}

void enemyWallCollision()
{
  if (enemy.x <= 100)
  {
    enemy.x = 100;
  }
  if (enemy.x >= width-100)
  {
    enemy.x = width-100;
  }
  if (enemy.y <= 100)
  {
    enemy.y = 100;
  }
  if (enemy.y >= height-100)
  {
    enemy.y = height-100;
  }
}

void foodWallCollision()
{
  if (food.x <= 100)
  {
    food.x = 100;
  }
  if (food.x >= width-100)
  {
    food.x = width-100;
  }
  if (food.y <= 100)
  {
    food.y = 100;
  }
  if (food.y >= height-100)
  {
    food.y = height-100;
  }
}

void updateEntities()
{
  player.display();
  player.movement();
  player.increaseScore();
  player.takeDamage();


  enemy.display();
  enemy.randomMovement();
  enemy.moveTowardsPlayer(); 

  food.display();
  food.moveAwayFromPlayer();

  playerWallCollision();
  enemyWallCollision();
  foodWallCollision();

  //Victory Screen
  if (player.score >= 21)
  {
    file4.stop();
    file3.play(1, 0.5);

    background(#FFD97D);
    //Static Food
    image(food.f, 30, 50, size, size);
    image(food.f, 30, 100, size, size);
    image(food.f, 30, 150, size, size);
    image(food.f, 30, 200, size, size);
    image(food.f, 30, 250, size, size);

    image(food.f2, 570, 50, size, size);
    image(food.f2, 570, 100, size, size);
    image(food.f2, 570, 150, size, size);
    image(food.f2, 570, 200, size, size);
    image(food.f2, 570, 250, size, size);

    image(food.f3, 30, 300, size, size);
    image(food.f3, 30, 350, size, size);
    image(food.f3, 30, 400, size, size);
    image(food.f3, 30, 450, size, size);
    image(food.f3, 30, 500, size, size);

    image(food.f4, 570, 300, size, size);
    image(food.f4, 570, 350, size, size);
    image(food.f4, 570, 400, size, size);
    image(food.f4, 570, 450, size, size);
    image(food.f4, 570, 500, size, size);

    image(food.kingF, 300, 565, size+40, size+40);

    rectMode(CENTER);
    fill(#562C2C);
    rect(300, 425, 475, 150);
    image(beegBiver, 300, 200, -300, -250);
    image(food.kingF, 300, 75, size+40, size+40);
    textSize(30);
    fill(#F2542D);
    text("You've collected all the fruit!", 130, 390);
    text("Even The King of Fruits!", 150, 410);
    text("Which means...", 225, 460);
    text("You are the new King of Food!", 130, 480);

    // Enemy will run away from you when you win
    // (So they don't interrupt the victory screen.
    if (player.x < enemy.x)
    {
      enemy.x += 2;
    }
    if (player.x > enemy.x)
    {
      enemy.x -= 2;
    }
    if (player.y < food.y)
    {
      enemy.y += 2;
    }
    if (player.y > food.y)
    {
      enemy.y -= 2;
    }
    noLoop();
  }

  //Game Over Screen
  if (player.health == 0)
  {
    background(#4B7C5B);

    imageMode(CENTER);

    image(gameOver, 300, 300, -350, -300);
    fill(#F5FF6F);
    textSize(200);

    text("G", 100, 150);
    text("A", 203, 165);
    text("M", 300, 150);
    text("E", 403, 165);

    text("O", 100, 550);
    text("V", 208, 565);
    text("E", 300, 550);
    text("R", 383, 565);
  }
}

// Probably doesn't need to be a method.
void gameJam()
{
  file4.loop(1, 0.2);
}

void keyReleased()
{
  keyCode = -1;
}
