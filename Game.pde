import java.util.Random;

class Game
{
  private Random rnd;
  private final int width;
  private final int height;
  private int[][] board;
  private Keys keys;
  private int playerLife;
  private Dot player;
  private Dot secondPlayer;
  private Dot[] enemies;
  private Dot[] food;
  
   
  Game(int width, int height, int numberOfEnemies, int numberOfFood)
  {
    if(width < 10 || height < 10)
    {
      throw new IllegalArgumentException("Width and height must be at least 10");
    }
    if(numberOfEnemies < 0)
    {
      throw new IllegalArgumentException();
    } 
        if(numberOfFood < 0)
    {
      throw new IllegalArgumentException();
    } 
    this.rnd = new Random();
    this.board = new int[width][height];
    this.width = width;
    this.height = height;
    keys = new Keys();
    player = new Dot(0,0,width-1, height-1);
    secondPlayer = new Dot(0,0,width-1, height-1); 
    enemies = new Dot[numberOfEnemies];
    for(int i = 0; i < numberOfEnemies; ++i)
    {
      enemies[i] = new Dot(width-1, height-1, width-1, height-1);
    }
    food = new Dot[numberOfFood];
    for(int i = 0; i < numberOfFood; ++i)
    {
      food[i] = new Dot(width-1, height-1, width-1, height-1);
    }
    this.playerLife = 100;
  }
  
  public int getWidth()
  {
    return width;
  }
  
  public int getHeight()
  {
    return height;
  }
  
  public int getPlayerLife()
  {
    return playerLife;
  }
  
  public void onKeyPressed(char ch, int code)
  {
    keys.onKeyPressed(ch, code);
  }
  
  public void onKeyReleased(char ch, int code)
  {
    keys.onKeyReleased(ch, code);
  }
  
    public void onKeyPressedsecondPlayer(char ch)
  {
    keys.onKeyPressedsecondPlayer(ch);
  }
  
  public void onKeyReleasedsecondPlayer(char ch)
  {
    keys.onKeyReleasedsecondPlayer(ch);
  }
  
  public void update()
  {
    updatePlayer();
    updatesecondPlayer(); 
    updateEnemies();
    updateFood();
    checkForCollisions();
    clearBoard();
    populateBoard();
  }
  
  public int[][] getBoard()
  {
    //ToDo: Defensive copy?
    return board;
  }
  
  private void clearBoard()
  {
    for(int y = 0; y < height; ++y)
    {
      for(int x = 0; x < width; ++x)
      {
        board[x][y]=0;
      }
    }
  }
  
  private void updatePlayer()
  {
    //Update player
    if(keys.wDown() && !keys.sDown())
    {
      player.moveUp();
    }
    if(keys.aDown() && !keys.dDown())
    {
      player.moveLeft();
    }
    if(keys.sDown() && !keys.wDown())
    {
      player.moveDown();
    }
    if(keys.dDown() && !keys.aDown())
    {
      player.moveRight();
    }  
  }
  
    private void updatesecondPlayer()
  {
    //Update player
    if(keys.iDown() && !keys.iDown())
    {
      secondPlayer.moveUp();
    }
    if(keys.jDown() && !keys.jDown())
    {
      secondPlayer.moveLeft();
    }
    if(keys.kDown() && !keys.kDown())
    {
      secondPlayer.moveDown();
    }
    if(keys.lDown() && !keys.lDown())
    {
      secondPlayer.moveRight();
    }  
  }

  private void updateFood()
  {
    for(int i = 0; i < food.length; ++i)
    {
      //Should we follow or move randomly?
      //2 out of 3 we will follow..
      if(rnd.nextInt(3) < 2)
      {
        //We follow
        int dx = player.getX() - food[i].getX();
        int dy = player.getY() - food[i].getY();
        if(abs(dx) > abs(dy))
        {
          if(dx > 0)
          {
            //Player is to the right
            food[i].moveLeft();
          }
          else
          {
            //Player is to the left
            food[i].moveRight();
          }
        }
        else if(dy > 0)
        {
          //Player is down;
          food[i].moveUp();
        }
        else
        {//Player is up;
          food[i].moveDown();
        }
      }
      else
      {
        //We move randomly
        int move = rnd.nextInt(4);
        if(move == 0)
        {
          //Move right
          food[i].moveRight();
        }
        else if(move == 1)
        {
          //Move left
          food[i].moveLeft();
        }
        else if(move == 2)
        {
          //Move up
          food[i].moveUp();
        }
        else if(move == 3)
        {
          //Move down
          food[i].moveDown();
        }
      }
    }
  }
  
    private void updateEnemies()
  {
    for(int i = 0; i < enemies.length; ++i)
    {
      //Should we follow or move randomly?
      //2 out of 3 we will follow..
      if(rnd.nextInt(3) < 2)
      {
        //We follow
        int dx = player.getX() - enemies[i].getX();
        int dy = player.getY() - enemies[i].getY();
        if(abs(dx) > abs(dy))
        {
          if(dx > 0)
          {
            //Player is to the right
            enemies[i].moveRight();
          }
          else
          {
            //Player is to the left
            enemies[i].moveLeft();
          }
        }
        else if(dy > 0)
        {
          //Player is down;
          enemies[i].moveDown();
        }
        else
        {//Player is up;
          enemies[i].moveUp();
        }
      }
      else
      {
        //We move randomly
        int move = rnd.nextInt(4);
        if(move == 0)
        {
          //Move right
          enemies[i].moveRight();
        }
        else if(move == 1)
        {
          //Move left
          enemies[i].moveLeft();
        }
        else if(move == 2)
        {
          //Move up
          enemies[i].moveUp();
        }
        else if(move == 3)
        {
          //Move down
          enemies[i].moveDown();
        }
      }
    }
  }
    
  private void populateBoard()
  {
    //Insert player
    board[player.getX()][player.getY()] = 1;
    //Insert secondPlayer
    board[secondPlayer.getX()][secondPlayer.getY()] = 3;
    //Insert enemies
    for(int i = 0; i < enemies.length; ++i)
    {
      board[enemies[i].getX()][enemies[i].getY()] = 2;
    }
    //Insert food
    for(int i = 0; i < food.length; ++i)
    {
      board[food[i].getX()][food[i].getY()] = 4;
    }
  }
   
  private void checkForCollisions()
  {
    //Check enemy collisions
    for(int i = 0; i < enemies.length; ++i)
    {
      if(enemies[i].getX() == player.getX() && enemies[i].getY() == player.getY())
      {
        //We have a collision
        --playerLife;
      }
    }
  }
}

//private void eatFood()
//check for food collisions 
//if(x.get(0)==foodx && y.get(0)==foody){
//foodx = (int)random(0, width);
//foody = (int)random(0, height; 
//} else {
//x.remove(x.size()-1);
//y.remove(y.size()-1);
//}
