class Food
{
  int x;
  int y;
  Player player;

  PImage f;
  PImage f2;
  PImage f3;
  PImage f4;
  PImage kingF;

  Food(int tempX, int tempY, Player tempPlayer)
  {
    x = tempX;
    y = tempY;
    player = tempPlayer;

    f = loadImage("PixelOrange.png");
    f2 = loadImage("PixelGrape.png");
    f3 = loadImage("PixelWaterMelon.png");
    f4 = loadImage("PixelPizza.png");
    kingF = loadImage("KingApple.png");
  }

  void moveAwayFromPlayer()
  {
    if (player.x < food.x)
    {
      food.x += 2;
    }
    if (player.x > food.x)
    {
      food.x -= 2;
    }
    if (player.y < food.y)
    {
      food.y += 2;
    }
    if (player.y > food.y)
    {
      food.y -= 2;
    }
  }

  void display()
  {
    //Display different kinds of fruit. When player hits 20 points
    // display King of Fruits. If player gets the King of Fruits, they win.
    if (player.score >= 20)
    {
      image(kingF, x, y, size+20, size+20);
    } else if (player.score >= 15)
    {
      image(f4, x, y, size, size);
    } else if (player.score >= 10)
    {
      image(f3, x, y, size, size);
    } else if (player.score >= 5)
    {
      image(f2, x, y, size, size);
    } else if (player.score >= 0)
    {
      image(f, x, y, size, size);
    }
  }
}
