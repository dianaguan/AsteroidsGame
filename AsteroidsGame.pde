SpaceShip one = new SpaceShip();
Star [] sky = new Star[100];
//Asteroids [] obstacles = new Asteroids[10];
ArrayList <Asteroids> theList = new ArrayList <Asteroids>();
public void setup() 
{
  size(800,500);
  for (int i = 0; i < sky.length; i++){
    sky[i] = new Star();
  }
  for (int j = 0; j < 15; j++){
     theList.add(new Asteroids());
  }
}
public void draw() 
{
  //your code here
  background(#0A0A29);
  one.show();
  one.move();
  for (int i = 0; i < sky.length; i++){
    sky[i].show();
  }
  for (int j = 0; j < theList.size(); j++){
    theList.get(j).show();
    theList.get(j).move();
    if(dist(theList.get(j).getX(), theList.get(j).getY(), one.getX(), one.getY())<25)
      theList.remove(j);
  }
}
public void keyPressed(){
  //hyperspace
  if(key == 'h'){
  
    one.setX((int)(Math.random()*800));
    one.setY((int)(Math.random()*500));
  }
  //rotate and accelerate
  if (keyPressed == true){
    if(keyCode == LEFT){
      one.rotate(-10);
    }
    if(keyCode == RIGHT){
      one.rotate(10);
    }
    if(keyCode == UP){
      one.accelerate(0.5);
    }
    if(keyCode == DOWN){
      one.accelerate(-0.5);
    }
  }
}

//star class
class Star 
{
  private int myX, myY;
  public Star(){
    myX = (int)(Math.random()*800);
    myY = (int)(Math.random()*500);
  }
  public void show(){
    fill(255, 174, 0);
    ellipse(myX, myY, 1, 1);
  }
}
//spaceship class
class SpaceShip extends Floater  
{   
    public SpaceShip(){
      //spaceship shape
      corners = 4;
      xCorners = new int[corners];
      yCorners = new int[corners];
      xCorners[0] = -8;
      yCorners[0] = -8;
      xCorners[1] = 16;
      yCorners[1] = 0;
      xCorners[2] = -8;
      yCorners[2] = 8;
      xCorners[3] = 0;
      yCorners[3] = 0;


      //initialize spaceship variables
      myColor = color(250);
      myCenterX = 250;
      myCenterY = 250;
      setDirectionX(0);
      setDirectionY(0);
      myPointDirection=0;
    }
    public void setX(int x){myCenterX = x;}
    public int getX(){return (int)myCenterX;}
    public void setY(int y){myCenterY = y;}
    public int getY(){return (int)myCenterY;}
    public void setDirectionX(double x){myDirectionX = x;}
    public double getDirectionX(){return myDirectionX;}
    public void setDirectionY(double y){myDirectionY = y;}
    public double getDirectionY(){return myDirectionY;}
    public void setPointDirection(int degrees){myPointDirection = degrees;}
    public double getPointDirection(){return myPointDirection;}
}
class Asteroids extends Floater {
    //your code here
    private int rotSpeed;
    public Asteroids(){
      //asteroids shape
     corners = 6;
     xCorners = new int[corners];
     yCorners = new int[corners];
     xCorners[0] = -11;
     yCorners[0] = -8;
     xCorners[1] = 7;
     yCorners[1] = -8;
     xCorners[2] = 13;
     yCorners[2] = 0;
     xCorners[3] = 6;
     yCorners[3] = 10;
     xCorners[4] = -11;
     yCorners[4] = 8;
     xCorners[5] = -5;
     yCorners[5] = 0;

      //initialize asteroids variables
      myColor = color(103,71,56);
      myCenterX = Math.random()*800;
      myCenterY = Math.random()*500;
      setDirectionX((int)(Math.random()*3)-1);
      setDirectionY((int)(Math.random()*3)-1);
      myPointDirection=0;
      rotSpeed = ((int)(Math.random()*10)-5);
      
    }
    public void setX(int x){myCenterX = x;}
    public int getX(){return (int)myCenterX;}
    public void setY(int y){myCenterY = y;}
    public int getY(){return (int)myCenterY;}
    public void setDirectionX(double x){myDirectionX = x;}
    public double getDirectionX(){return myDirectionX;}
    public void setDirectionY(double y){myDirectionY = y;}
    public double getDirectionY(){return myDirectionY;}
    public void setPointDirection(int degrees){myPointDirection = degrees;}
    public double getPointDirection(){return myPointDirection;}
    //new asteroid move function
    public void move()
    {
      rotate(rotSpeed);
      super.move();
    }
}
abstract class Floater //Do NOT modify the Floater class! Make changes in the SpaceShip class 
{   
  protected int corners;  //the number of corners, a triangular floater has 3   
  protected int[] xCorners;   
  protected int[] yCorners;   
  protected int myColor;   
  protected double myCenterX, myCenterY; //holds center coordinates   
  protected double myDirectionX, myDirectionY; //holds x and y coordinates of the vector for direction of travel   
  protected double myPointDirection; //holds current direction the ship is pointing in degrees    
  abstract public void setX(int x);  
  abstract public int getX();   
  abstract public void setY(int y);   
  abstract public int getY();   
  abstract public void setDirectionX(double x);   
  abstract public double getDirectionX();   
  abstract public void setDirectionY(double y);   
  abstract public double getDirectionY();   
  abstract public void setPointDirection(int degrees);   
  abstract public double getPointDirection(); 

  //Accelerates the floater in the direction it is pointing (myPointDirection)   
  public void accelerate (double dAmount)   
  {          
    //convert the current direction the floater is pointing to radians    
    double dRadians =myPointDirection*(Math.PI/180);     
    //change coordinates of direction of travel    
    myDirectionX += ((dAmount) * Math.cos(dRadians));    
    myDirectionY += ((dAmount) * Math.sin(dRadians));       
  }   
  public void rotate (int nDegreesOfRotation)   
  {     
    //rotates the floater by a given number of degrees    
    myPointDirection+=nDegreesOfRotation;   
  }   
  public void move ()   //move the floater in the current direction of travel
  {      
    //change the x and y coordinates by myDirectionX and myDirectionY       
    myCenterX += myDirectionX;    
    myCenterY += myDirectionY;     

    //wrap around screen    
    if(myCenterX >width)
    {     
      myCenterX = 0;    
    }    
    else if (myCenterX<0)
    {     
      myCenterX = width;    
    }    
    if(myCenterY >height)
    {    
      myCenterY = 0;    
    }   
    else if (myCenterY < 0)
    {     
      myCenterY = height;    
    }   
  }   
  public void show ()  //Draws the floater at the current position  
  {             
    fill(myColor);   
    stroke(myColor);    
    //convert degrees to radians for sin and cos         
    double dRadians = myPointDirection*(Math.PI/180);                 
    int xRotatedTranslated, yRotatedTranslated;    
    beginShape();         
    for(int nI = 0; nI < corners; nI++)    
    {     
      //rotate and translate the coordinates of the floater using current direction 
      xRotatedTranslated = (int)((xCorners[nI]* Math.cos(dRadians)) - (yCorners[nI] * Math.sin(dRadians))+myCenterX);     
      yRotatedTranslated = (int)((xCorners[nI]* Math.sin(dRadians)) + (yCorners[nI] * Math.cos(dRadians))+myCenterY);      
      vertex(xRotatedTranslated,yRotatedTranslated);    
    }   
    endShape(CLOSE);  
  }

} 

