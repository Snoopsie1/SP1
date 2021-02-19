class Player
{
  int x;
  int y;

  int health;
  PImage hp;
  //Images of Biver
  PImage p;
  PImage pD;
  PImage pU;
  PImage pR;
  boolean up = false;
  boolean down = false;
  boolean left = true;
  boolean right = false;

  int score;

  Player(int tempX, int tempY, int tempHealth)
  {
    x = tempX;
    y = tempY;
    health = tempHealth;
    hp = loadImage("BiverHealth.png");
    p = loadImage("PixelBiver2.png");
    pU = loadImage("PixelBiver2UP.png");
    pD = loadImage("PixelBiver2DOWN.png");
    pR = loadImage("PixelBiver2RIGHT.png");
  }

  void display()
  {
    imageMode(CENTER);
    image(p, x, y, size-5, size-5); 
    if (up == true)
    {
      image(pU, x, y, size-5, size-5);
    }
    if (down == true)
    {
      image(pD, x, y, size-5, size-5);
    }
    if (right == true)
    {
      image(pR, x, y, size-5, size-5);
    }
  }

  void takeDamage()
  {
    int enemyXToPlayer = Math.abs(player.x - enemy.x);
    int enemyYToPlayer = Math.abs(player.y - enemy.y);

    if (enemyXToPlayer <= 30 && enemyYToPlayer <= 30)
    {
      health--;
    }
    if (health <= 0)
    {
      health = 0;
      file4.stop();
      file.play(1, 0.2);
      noLoop();
    }
  } 
  void movement()
  {
    if (key == 's')
    {
      score = 21;
    }
    if (keyCode == UP)
    {
      up = true;

      down = false;
      right = false;
      left = false;
      player.y -= 20;
    }
    if (keyCode == RIGHT)
    {
      right = true;

      left = false;
      down = false;
      up = false;
      player.x += 20;
    }
    if (keyCode == LEFT)
    {
      left = true;

      right = false;
      up = false;
      down = false;
      player.x -= 20;
    }
    if (keyCode == DOWN)
    {
      down = true;

      up = false;
      right = false;
      left = false;
      player.y += 20;
    }
  }
  void increaseScore()
  {
    int foodXToPlayer = Math.abs(player.x - food.x);
    int foodYToPlayer = Math.abs(player.y - food.y);

    if (foodXToPlayer <= 30 && foodYToPlayer <= 30)
    {
      file2.play(1, 0.5);
      player.score++; 
      food.x = (int)random(100, 500);
      food.y = (int)random(100, 500);
    }  

    // Spaghetti code, please don't look.
    // It's in the bottom of my class for a reason:D   
    switch (player.score)
    {
    case 0:
      break;
    case 1:
      image(food.f, 30, 50, size, size);
      break;
    case 2:
      image(food.f, 30, 50, size, size);
      image(food.f, 30, 100, size, size);
      break;
    case 3:
      image(food.f, 30, 50, size, size);
      image(food.f, 30, 100, size, size);
      image(food.f, 30, 150, size, size);
      break;
    case 4:
      image(food.f, 30, 50, size, size);
      image(food.f, 30, 100, size, size);
      image(food.f, 30, 150, size, size);
      image(food.f, 30, 200, size, size);
      break;

    case 5:
      image(food.f, 30, 50, size, size);
      image(food.f, 30, 100, size, size);
      image(food.f, 30, 150, size, size);
      image(food.f, 30, 200, size, size);
      image(food.f, 30, 250, size, size);
      break;
    case 6: 
      image(food.f, 30, 50, size, size);
      image(food.f, 30, 100, size, size);
      image(food.f, 30, 150, size, size);
      image(food.f, 30, 200, size, size);
      image(food.f, 30, 250, size, size);

      image(food.f2, 570, 50, size, size);
      break;
    case 7: 
      image(food.f, 30, 50, size, size);
      image(food.f, 30, 100, size, size);
      image(food.f, 30, 150, size, size);
      image(food.f, 30, 200, size, size);
      image(food.f, 30, 250, size, size);

      image(food.f2, 570, 50, size, size);
      image(food.f2, 570, 100, size, size);
      break;
    case 8:
      image(food.f, 30, 50, size, size);
      image(food.f, 30, 100, size, size);
      image(food.f, 30, 150, size, size);
      image(food.f, 30, 200, size, size);
      image(food.f, 30, 250, size, size);

      image(food.f2, 570, 50, size, size);
      image(food.f2, 570, 100, size, size);
      image(food.f2, 570, 150, size, size);
      break;
    case 9:
      image(food.f, 30, 50, size, size);
      image(food.f, 30, 100, size, size);
      image(food.f, 30, 150, size, size);
      image(food.f, 30, 200, size, size);
      image(food.f, 30, 250, size, size);

      image(food.f2, 570, 50, size, size);
      image(food.f2, 570, 100, size, size);
      image(food.f2, 570, 150, size, size);
      image(food.f2, 570, 200, size, size);
      break;
    case 10:
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
      break;
    case 11:
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
      break;
    case 12:
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
      break;
    case 13:
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
      break;
    case 14:
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
      break;
    case 15:
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
      break;
    case 16:
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
      break;
    case 17:
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
      break;
    case 18:
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
      break;
    case 19:
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
      break;
    case 20:
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
      break;
    case 21:
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
      break;
      // I told you it wasn't pretty.
      // Yes, I am ashamed.
    }
  }
}
