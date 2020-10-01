class Keys
{
  private boolean wDown = false;
  private boolean aDown = false;
  private boolean sDown = false;
  private boolean dDown = false;
  
  private boolean iDown = false;
  private boolean jDown = false;
  private boolean kDown = false;
  private boolean lDown = false;
  
  public Keys(){}
  
  public boolean wDown()
  {
    return wDown;
  }
  
  public boolean aDown()
  {
    return aDown;
  }
  
  public boolean sDown()
  {
    return sDown;
  }
  
  public boolean dDown()
  {
    return dDown;
  }
  
  public boolean iDown()
  {
    return iDown;
  }
  
  public boolean jDown()
  {
    return jDown;
  }
  
  public boolean kDown()
  {
    return kDown;
  }
  
  public boolean lDown()
  {
    return lDown;
  }

  
  void onKeyPressed(char ch, int code)
  {
    if(ch == 'W' || ch == 'w' || code == UP)
    {
      wDown = true;
    }
    else if (ch == 'A' || ch == 'a' || code == LEFT)
    {
      aDown = true;
    }
    else if(ch == 'S' || ch == 's' || code ==  DOWN)
    {
      sDown = true;
    }
    else if(ch == 'D' || ch == 'd' || code == RIGHT)
    {
      dDown = true;
    }
  }
  
    void onKeyPressedsecondPlayer(char ch)
  {
    if(ch == 'I' || ch == 'i')
    {
     iDown = true;
    }
    else if (ch == 'J' || ch == 'j')
    {
      jDown = true;
    }
    else if(ch == 'K' || ch == 'k')
    {
      kDown = true;
    }
    else if(ch == 'L' || ch == 'l')
    {
      lDown = true;
    }
  }
  
  void onKeyReleased(char ch, int code)
  { //<>//
    if(ch == 'W' || ch == 'w' || code == UP )
    {
      wDown = false;
    }
    else if (ch == 'A' || ch == 'a' || code == LEFT)
    {
      aDown = false;
    }
    else if(ch == 'S' || ch == 's' || code == DOWN)
    {
      sDown = false;
    }
    else if(ch == 'D' || ch == 'd' || code == RIGHT)
    {
      dDown = false;
    }
  }
  
    void onKeyReleasedsecondPlayer(char ch)
  {
    if(ch == 'I' || ch == 'i')
    {
      iDown = false;
    }
    else if (ch == 'J' || ch == 'j')
    {
      jDown = false;
    }
    else if(ch == 'K' || ch == 'k')
    {
      kDown = false;
    }
    else if(ch == 'L' || ch == 'l')
    {
      lDown = false;
    }
  }
}

 
