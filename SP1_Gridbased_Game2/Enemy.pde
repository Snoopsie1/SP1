class Enemy
{
  int x;
  int y;
  Player player;

  PImage pGhost;

  Enemy(int tempX, int tempY, Player tempPlayer)
  {
    x = tempX;
    y = tempY;
    player = tempPlayer;

    pGhost = loadImage("PixelGhost.png");
  }

  void moveTowardsPlayer()
  { 
    if (player.x < enemy.x)
    {
      enemy.x -=4;
    }
    if (player.x > enemy.x)
    {
      enemy.x +=4;
    }
    if (player.y < enemy.y)
    {
      enemy.y -=4;
    }
    if (player.y > enemy.y)
    {
      enemy.y +=4;
    }

    if (enemy.x == player.x && enemy.y == player.y)
    {
      enemy.x = player.x;
      enemy.y = player.y;
    }
  }

  void display()
  {
    imageMode(CENTER);
    image(pGhost, x, y, size+10, size+10);
  }

  // Makes the enemy twitchy - Somewhat creepy.
  void randomMovement()
  {
    int chance = (int)random(0, 16);

    if (chance == 4)
    {
      enemy.x +=20;
    }
    if (chance == 3)
    {
      enemy.x -=20;
    }
    if (chance == 2)
    {
      enemy.y +=20;
    }
    if (chance == 1)
    {
      enemy.y -=20;
    }
  }
}
