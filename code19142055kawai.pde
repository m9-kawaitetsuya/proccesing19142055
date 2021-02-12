
float UarmL =250 ; //length upper arm
float FarmL =170 ; //length for arm
float Uarm_angle; // angle upper arm
float Farm_angle; // angle for arm
float cameraX; //locate camera x
float cameraY; //locate camera y
float cameraZ; //locate camera z
float CX; 
float CY;
float CZ;

void setup() {
  fullScreen(P3D);
  strokeWeight(35);
 
 
 camera(cameraX,cameraY,cameraZ,CX,CY,CZ,0,0,1);
 
}

void draw() {
 
  
  background(1);
  if (keyPressed){
    if (key == 'a') cameraX += 5; //At first,you have to push w and e to find arm.
    if (key == 's') cameraY += 5;
    if (key == 'd') cameraZ += 5;
    if (key == 'q') cameraX -= 5;
    if (key == 'w') cameraY -= 5; // push
    if (key == 'e') cameraZ -= 5; //push
    if (key == 'f') CX += 5;
    if (key == 'g') CY += 5;
    if (key == 'h') CZ += 5;
    if (key == 'r') CX -= 5;
    if (key == 't') CY -= 5;
    if (key == 'y') CZ -= 5;
  }
  camera(cameraX,cameraY,cameraZ,CX,CY,CZ,0,0,1);
  
  float x0 = width/2;
  float y0 = height/2;
  float x = mouseX-x0; 
  float y = mouseY-y0;
 
  stroke(0, 124, 0); 
  strokeWeight(49); 
  ellipse( mouseX-1, mouseY-1, 4,4); 

  float acosa = sq(x)+sq(y)+sq(UarmL)-sq(FarmL); 
  float acosb = 2*UarmL*sqrt(sq(x)+sq(y));
 
  if (mouseX >= x0){
    Uarm_angle = atan(y/x)+acos(acosa/acosb);
  } else {
    Uarm_angle = PI+atan(y/x)+acos(acosa/acosb); 
  }
 
  
  stroke(255, 255, 255); 
  strokeWeight(10); 
 
  line(x0,y0,x0+UarmL*cos(Uarm_angle), y0+UarmL*sin(Uarm_angle)); 

 
  float acosc = sq(UarmL)+sq(FarmL)-(sq(x)+sq(y)); 
  float acosd = 2*UarmL*FarmL; 
  
  float xa = x0+UarmL*cos(Uarm_angle);
  float ya = y0+UarmL*sin(Uarm_angle); 
  Farm_angle = acos(acosc/acosd)+PI;


  stroke(255, 255, 255); 
  line(xa, ya, xa+ FarmL*cos(Uarm_angle+Farm_angle), ya+ FarmL*sin(Uarm_angle+Farm_angle)); 


  
}
