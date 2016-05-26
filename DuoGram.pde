import java.util.ArrayList;
/**
 * Group 2:
 * Kesley Silbert (Concept Builder)
 * Luisa Botelho (Affect Architect)
 * Emily King (Affect Architect)
 * Marcelles Lowery (Craft Engineer)
 *
 * DuoGram:
 * Collaborative building game in which pieces are mixed 
 * between the players and they must silently try to figure
 * out which pieces to move to complete their tangram in the allotted time.
 *
 * Outside Source Code:
 * Timer - Source: plux. edited Nov 2014. millis() and timer. 1.0. Processing. https://forum.processing.org/two/discussion/1725/millis-and-timer
 * Polygon Point Collision - Source: Jeff Thompson. 2013.POINT/POLYGON COLLISION DETECTION. Processing. https://github.com/jeffThompson/CollisionDetectionFunctionsForProcessing/blob/master/pointPolygon/pointPolygon.pde
 * Triangle Point Collision - Source: Jeff Thompson. 2013. POINT/TRIANGLE COLLISION DETECTION. Processing. https://github.com/jeffThompson/CollisionDetectionFunctionsForProcessing/blob/master/pointTriangle/pointTriangle.pde
 */
 
PFont myFont;
PFont smallF;
boolean clickedInstruction = false;
boolean startGame = false;

// WRITE INSTRUCTIONS HERE
String instruct = "Taking turns each player must build their tangram within the allotted time.\nIf you need a shape from the other player's field you must first place one\nyou do not need in the neutral zone. When two shapes are in the neutral\nzone each player may grab one from the zone.";

boolean time = true;

ArrayList<Shape> shapes = new ArrayList();
TriShape tri1 = new TriShape(345, 560, 245, 660, 245, 460);
TriShape tri2 = new TriShape(790, 460, 890, 560, 990, 460);
TriShape tri3 = new TriShape(110, 535, 60, 485, 110, 435);
TriShape tri4 = new TriShape(890, 60, 940, 10, 990, 60);
TriShape tri5 = new TriShape(665, 625, 765, 525, 765, 625);
QuadShape diam1 = new QuadShape(10, 60, 60, 10, 110, 60, 60, 110);
QuadShape trap1 = new QuadShape(835, 676, 885, 626, 985, 626, 935, 676);
// player 1's tangram

TriShape tri6 = new TriShape(230, 120, 330, 220, 330, 20);
TriShape tri7 = new TriShape(400, 225, 500, 125, 600, 225);
TriShape tri8 = new TriShape(20, 675, 70, 625, 20, 575);
TriShape tri9 = new TriShape(675, 425, 725, 475, 775, 425);
TriShape tri10 = new TriShape(665, 60, 765, 60, 665, 160);
QuadShape diam2 = new QuadShape(450, 550, 500, 500, 550, 550, 500, 600);
QuadShape trap2 = new QuadShape(60, 175, 110, 125, 210, 125, 160, 175);
// player 2's tangram

void setup() {
  size(1000, 685);
  
  myFont = loadFont("AvenirNext-Bold-50.vlw");
  smallF = loadFont("Avenir-Black-25.vlw");
  
  shapes.add(tri1);
  shapes.add(tri2);
  shapes.add(tri3);
  shapes.add(tri4);
  shapes.add(tri5);
  shapes.add(trap1);
  shapes.add(diam1);
  // player 1's tangram
  shapes.add(tri6);
  shapes.add(tri7);
  shapes.add(tri8);
  shapes.add(tri9);
  shapes.add(tri10);
  shapes.add(diam2);
  shapes.add(trap2);
  // player 2's tangram
}

int timer(int timerLength) { //Source: plux (see citation at top)
  int remainingTime = timerLength-millis();
 
  if(remainingTime/1000>0){
    int actualTime = (remainingTime/1000);
    return actualTime;
   }
  else {
    time = false;
    return 0;     
  }
}

void mousePressed() {
  if(mouseX >= 365 && mouseX <= 650 && mouseY >= 360 && mouseY <= 410) {
    clickedInstruction = true;
  }
  else {
    clickedInstruction = false;
  }
  if (mouseX >= 425 && mouseX <= 585 && mouseY >= 430 && mouseY <= 480) {
    startGame = true;
  }
}

void draw() {
 if(!startGame) {
   background(191,0, 40);
  
   fill(174, 175, 166);
   textFont(myFont, 50);
   text("Instructions", 365, 400);
   text("START", 425, 470);
  
  
   if (clickedInstruction) {
     textFont(smallF, 25);
     text(instruct, 100, 525);
   }
   fill(174, 175, 166);
   noStroke();
   //D
   rect(110, 60, 25, 140);
   triangle(140, 60, 140, 200, 195, 130);
   
   //u
   rect(210, 110, 25, 90);
   rect(275, 110, 25, 90);
   triangle(270, 170, 270, 200, 240, 200);

   //o
 
   rect(320, 110, 25, 90);
   rect(380, 110, 25, 90);
   rect(350, 110, 25, 25);
   rect(350, 175, 25, 25);
 
   //g
 
   rect(425, 110, 25, 90);
   rect(485, 110, 25, 180);
   
   rect(455, 110, 25, 25);
   rect(455, 175, 25, 25);
   
   triangle(425, 290, 480, 290, 453, 270);
   
   //r
   rect(530, 110, 25, 90);
   triangle(560, 110, 620, 110, 585, 130);
   
   //a
   rect(635, 110, 25, 90);
   rect(665, 110, 25, 25);
   rect(665, 175, 25, 25);
   rect(695, 110, 25, 105);
 
   //m
   rect(740, 110, 25, 90);
   triangle(765, 110, 795, 110, 795, 140);
   rect(800, 110, 25, 90);
   triangle(860, 110, 830, 110, 830, 140);
   rect(860, 110, 25, 90);
     
   }
   else {
     game();
   }
}

void game() {
  if(time) {
    bg();
    
    stroke(0,105,215);
    fill(0,105,215);
    triangle(tri1.x1, tri1.y1, tri1.x2, tri1.y2, tri1.x3, tri1.y3);
    stroke(45,174,132);
    fill(45,174,132);
    triangle(tri2.x1, tri2.y1, tri2.x2, tri2.y2, tri2.x3, tri2.y3);
    stroke(234,187,184);
    fill(234,187,184);
    triangle(tri3.x1, tri3.y1, tri3.x2, tri3.y2, tri3.x3, tri3.y3);
    stroke(153,207,212);
    fill(153,207,212);
    triangle(tri4.x1, tri4.y1, tri4.x2, tri4.y2, tri4.x3, tri4.y3);
    stroke(0,161,178);
    fill(0,161,178);
    triangle(tri5.x1, tri5.y1, tri5.x2, tri5.y2, tri5.x3, tri5.y3);
    stroke(222,130,98);
    fill(222,130,98);
    quad(trap1.x1, trap1.y1, trap1.x2, trap1.y2, trap1.x3, trap1.y3, trap1.x4, trap1.y4);
    stroke(197,202,233);
    fill(197,202,233);
    quad(diam1.x1, diam1.y1, diam1.x2, diam1.y2, diam1.x3, diam1.y3, diam1.x4, diam1.y4);
    // player 1's tangram
    stroke(222,130,98);
    fill(222,130,98);
    triangle(tri6.x1, tri6.y1, tri6.x2, tri6.y2, tri6.x3, tri6.y3);
    stroke(197,202,233);
    fill(197,202,233);
    triangle(tri7.x1, tri7.y1, tri7.x2, tri7.y2, tri7.x3, tri7.y3);
    stroke(0,105,215);
    fill(0,105,215);
    triangle(tri8.x1, tri8.y1, tri8.x2, tri8.y2, tri8.x3, tri8.y3);
    stroke(45,174,132);
    fill(45,174,132);
    triangle(tri9.x1, tri9.y1, tri9.x2, tri9.y2, tri9.x3, tri9.y3);
    stroke(234,187,184);
    fill(234,187,184);
    triangle(tri10.x1, tri10.y1, tri10.x2, tri10.y2, tri10.x3, tri10.y3);
    stroke(153,207,212);
    fill(153,207,212);
    quad(diam2.x1, diam2.y1, diam2.x2, diam2.y2, diam2.x3, diam2.y3, diam2.x4, diam2.y4);
    stroke(0,161,178);
    fill(0,161,178);
    quad(trap2.x1, trap2.y1, trap2.x2, trap2.y2, trap2.x3, trap2.y3, trap2.x4, trap2.y4);
    // player 2's tangram
    
    fill(255,255,255);
    textFont(smallF, 40);
    text(timer(300000), 455,50); // 300 secs (5 mins)
    
    if(mousePressed) {
      mouseClicked();
    }
    else {
      for(Shape s : shapes) {
        s.active = false;
      }
    }
  }
}

void bg() {
  stroke(255,255,255);
  fill(189,182,171);
  rect(0,0,1000,685);
  fill(191,0, 40);
  rect(350,0,300,685);
  fill(122,115,105);
  rect(75, 200, 200, 200);
  rect(725, 200, 200, 200);
}

public void moveTri1() {
    tri1.x1 = mouseX;
    tri1.x2 = mouseX - 100;
    tri1.x3 = mouseX - 100;
    
    tri1.y1 = mouseY;
    tri1.y2 = mouseY + 100;
    tri1.y3 = mouseY - 100;
}

public void moveTri2() {
    tri2.x1 = mouseX;
    tri2.x2 = mouseX + 100;
    tri2.x3 = mouseX + 200;
    
    tri2.y1 = mouseY;
    tri2.y2 = mouseY + 100;
    tri2.y3 = mouseY;
}

public void moveTri3() {
    tri3.x1 = mouseX;
    tri3.x2 = mouseX - 50;
    tri3.x3 = mouseX;
    
    tri3.y1 = mouseY;
    tri3.y2 = mouseY - 50;
    tri3.y3 = mouseY - 100;
}

public void moveTri4() {
    tri4.x1 = mouseX;
    tri4.x2 = mouseX + 50;
    tri4.x3 = mouseX + 100;
    
    tri4.y1 = mouseY;
    tri4.y2 = mouseY - 50;
    tri4.y3 = mouseY;
}

public void moveTri5() {
    tri5.x1 = mouseX;
    tri5.x2 = mouseX + 100;
    tri5.x3 = mouseX + 100;
    
    tri5.y1 = mouseY;
    tri5.y2 = mouseY - 100;
    tri5.y3 = mouseY;
}

public void moveTri6() {
    tri6.x1 = mouseX;
    tri6.x2 = mouseX + 100;
    tri6.x3 = mouseX + 100;
    
    tri6.y1 = mouseY;
    tri6.y2 = mouseY + 100;
    tri6.y3 = mouseY - 100;
}

public void moveTri7() {
    tri7.x1 = mouseX;
    tri7.x2 = mouseX + 100;
    tri7.x3 = mouseX + 200;
    
    tri7.y1 = mouseY;
    tri7.y2 = mouseY - 100;
    tri7.y3 = mouseY;
}

public void moveTri8() {
    tri8.x1 = mouseX;
    tri8.x2 = mouseX + 50;
    tri8.x3 = mouseX;
    
    tri8.y1 = mouseY;
    tri8.y2 = mouseY - 50;
    tri8.y3 = mouseY - 100;
}

public void moveTri9() {
    tri9.x1 = mouseX;
    tri9.x2 = mouseX + 50;
    tri9.x3 = mouseX + 100;
    
    tri9.y1 = mouseY;
    tri9.y2 = mouseY + 50;
    tri9.y3 = mouseY;
}

public void moveTri10() {
    tri10.x1 = mouseX;
    tri10.x2 = mouseX + 100;
    tri10.x3 = mouseX;
    
    tri10.y1 = mouseY;
    tri10.y2 = mouseY;
    tri10.y3 = mouseY + 100;
}

public void moveTrap1() {
    trap1.x1 = mouseX;
    trap1.x2 = mouseX + 50;
    trap1.x3 = mouseX + 150;
    trap1.x4 = mouseX + 100;
    
    trap1.y1 = mouseY;
    trap1.y2 = mouseY - 50;
    trap1.y3 = mouseY - 50;
    trap1.y4 = mouseY;
    
    updateQuad(trap1);
}

public void moveTrap2() {
    trap2.x1 = mouseX;
    trap2.x2 = mouseX + 50;
    trap2.x3 = mouseX + 150;
    trap2.x4 = mouseX + 100;
    
    trap2.y1 = mouseY;
    trap2.y2 = mouseY - 50;
    trap2.y3 = mouseY - 50;
    trap2.y4 = mouseY;
    
    updateQuad(trap2);
}

public void moveDiam1() {
    diam1.x1 = mouseX;
    diam1.x2 = mouseX + 50;
    diam1.x3 = mouseX + 100;
    diam1.x4 = mouseX + 50;
    
    diam1.y1 = mouseY;
    diam1.y2 = mouseY - 50;
    diam1.y3 = mouseY;
    diam1.y4 = mouseY + 50;
    
    updateQuad(diam1);
}

public void moveDiam2() {
    diam2.x1 = mouseX;
    diam2.x2 = mouseX + 50;
    diam2.x3 = mouseX + 100;
    diam2.x4 = mouseX + 50;
    
    diam2.y1 = mouseY;
    diam2.y2 = mouseY - 50;
    diam2.y3 = mouseY;
    diam2.y4 = mouseY + 50;
    
    updateQuad(diam2);
}

public void updateQuad(QuadShape myQuad) {
  //updating vertices
  myQuad.xver[0] = myQuad.x1;
  myQuad.xver[1] = myQuad.x2;
  myQuad.xver[2] = myQuad.x3;
  myQuad.xver[3] = myQuad.x4;
  
  myQuad.yver[0] = myQuad.y1;
  myQuad.yver[1] = myQuad.y2;
  myQuad.yver[2] = myQuad.y3;
  myQuad.yver[3] = myQuad.y4;
}

void mouseClicked() {
  if(trap1.polyCol(mouseX, mouseY) && !tri1.active && !tri2.active && !tri3.active //Source: Jeff Thompson (see citation at top)
  && !tri4.active && !tri5.active && !tri6.active  && !tri7.active && !tri8.active
  && !tri9.active && !tri10.active && !diam1.active && !trap2.active && !diam2.active || trap1.active) {
    trap1.active = true;
    moveTrap1();
  }
  else if(trap2.polyCol(mouseX, mouseY) && !tri1.active && !tri2.active && !tri3.active //Source: Jeff Thompson (see citation at top)
  && !tri4.active && !tri5.active && !tri6.active  && !tri7.active && !tri8.active
  && !tri9.active && !tri10.active && !diam1.active && !trap1.active && !diam2.active || trap2.active) {
    trap2.active = true;
    moveTrap2();
  }
  else if(diam1.polyCol(mouseX, mouseY) && !tri1.active && !tri2.active && !tri3.active //Source: Jeff Thompson (see citation at top)
  && !tri4.active && !tri5.active && !tri6.active  && !tri7.active && !tri8.active
  && !tri9.active && !tri10.active && !trap1.active && !trap2.active && !diam2.active || diam1.active) {
    diam1.active = true;
    moveDiam1();
  }
  else if(diam2.polyCol(mouseX, mouseY) && !tri1.active && !tri2.active && !tri3.active //Source: Jeff Thompson (see citation at top)
  && !tri4.active && !tri5.active && !tri6.active  && !tri7.active && !tri8.active
  && !tri9.active && !tri10.active && !trap1.active && !trap2.active && !diam1.active || diam2.active) {
    diam2.active = true;
    moveDiam2();
  }
  else if(abs((tri1.x1-mouseX)*(tri1.y2-mouseY)-(tri1.x2-mouseX)*(tri1.y1-mouseY))
  + abs((tri1.x2-mouseX)*(tri1.y3-mouseY)-(tri1.x3-mouseX)*(tri1.y2-mouseY))
  + abs((tri1.x3-mouseX)*(tri1.y1-mouseY)-(tri1.x1-mouseX)*(tri1.y3-mouseY)) //Source: Jeff Thompson (see citation at top)
  - abs((tri1.x2-tri1.x1)*(tri1.y3-tri1.y1)-(tri1.x3-tri1.x1)*(tri1.y2-tri1.y1))
   <= 50 && !tri2.active && !tri3.active && !tri4.active && !tri5.active && !tri6.active  && !tri7.active && !tri8.active && !tri9.active && !tri10.active && !diam1.active && !trap1.active && !diam2.active && !trap2.active || tri1.active == true)
   {
     tri1.active = true;
     moveTri1();
   }
   else if(abs((tri2.x1-mouseX)*(tri2.y2-mouseY)-(tri2.x2-mouseX)*(tri2.y1-mouseY))
  + abs((tri2.x2-mouseX)*(tri2.y3-mouseY)-(tri2.x3-mouseX)*(tri2.y2-mouseY))
  + abs((tri2.x3-mouseX)*(tri2.y1-mouseY)-(tri2.x1-mouseX)*(tri2.y3-mouseY)) //Source: Jeff Thompson (see citation at top)
  - abs((tri2.x2-tri2.x1)*(tri2.y3-tri2.y1)-(tri2.x3-tri2.x1)*(tri2.y2-tri2.y1))
   <= 50 && !tri1.active && !tri3.active && !tri4.active && !tri5.active && !tri6.active  && !tri7.active && !tri8.active && !tri9.active && !tri10.active && !diam1.active && !trap1.active && !diam2.active && !trap2.active || tri2.active == true)
   {
     tri2.active = true;
     moveTri2();
   }
   else if(abs((tri3.x1-mouseX)*(tri3.y2-mouseY)-(tri3.x2-mouseX)*(tri3.y1-mouseY))
  + abs((tri3.x2-mouseX)*(tri3.y3-mouseY)-(tri3.x3-mouseX)*(tri3.y2-mouseY))
  + abs((tri3.x3-mouseX)*(tri3.y1-mouseY)-(tri3.x1-mouseX)*(tri3.y3-mouseY)) //Source: Jeff Thompson (see citation at top)
  - abs((tri3.x2-tri3.x1)*(tri3.y3-tri3.y1)-(tri3.x3-tri3.x1)*(tri3.y2-tri3.y1))
   <= 50 && !tri1.active && !tri2.active && !tri4.active && !tri5.active && !tri6.active  && !tri7.active && !tri8.active && !tri9.active && !tri10.active && !diam1.active && !trap1.active && !diam2.active && !trap2.active || tri3.active == true)
   {
     tri3.active = true;
     moveTri3();
   }
   else if(abs((tri4.x1-mouseX)*(tri4.y2-mouseY)-(tri4.x2-mouseX)*(tri4.y1-mouseY))
   + abs((tri4.x2-mouseX)*(tri4.y3-mouseY)-(tri4.x3-mouseX)*(tri4.y2-mouseY))
   + abs((tri4.x3-mouseX)*(tri4.y1-mouseY)-(tri4.x1-mouseX)*(tri4.y3-mouseY)) //Source: Jeff Thompson (see citation at top)
   - abs((tri4.x2-tri4.x1)*(tri4.y3-tri4.y1)-(tri4.x3-tri4.x1)*(tri4.y2-tri4.y1))
    <= 50 && !tri1.active && !tri2.active && !tri3.active && !tri5.active && !tri6.active  && !tri7.active && !tri8.active && !tri9.active && !tri10.active && !diam1.active && !trap1.active && !diam2.active && !trap2.active || tri4.active == true)
    {
      tri4.active = true;
      moveTri4();
    }
    else if(abs((tri5.x1-mouseX)*(tri5.y2-mouseY)-(tri5.x2-mouseX)*(tri5.y1-mouseY))
    + abs((tri5.x2-mouseX)*(tri5.y3-mouseY)-(tri5.x3-mouseX)*(tri5.y2-mouseY))
    + abs((tri5.x3-mouseX)*(tri5.y1-mouseY)-(tri5.x1-mouseX)*(tri5.y3-mouseY)) //Source: Jeff Thompson (see citation at top)
    - abs((tri5.x2-tri5.x1)*(tri5.y3-tri5.y1)-(tri5.x3-tri5.x1)*(tri5.y2-tri5.y1))
     <= 50 && !tri1.active && !tri2.active && !tri3.active && !tri4.active && !tri6.active  && !tri7.active && !tri8.active && !tri9.active && !tri10.active && !diam1.active && !trap1.active && !diam2.active && !trap2.active || tri5.active == true)
     {
       tri5.active = true;
       moveTri5();
     }
     else if(abs((tri6.x1-mouseX)*(tri6.y2-mouseY)-(tri6.x2-mouseX)*(tri6.y1-mouseY))
    + abs((tri6.x2-mouseX)*(tri6.y3-mouseY)-(tri6.x3-mouseX)*(tri6.y2-mouseY))
    + abs((tri6.x3-mouseX)*(tri6.y1-mouseY)-(tri6.x1-mouseX)*(tri6.y3-mouseY)) //Source: Jeff Thompson (see citation at top)
    - abs((tri6.x2-tri6.x1)*(tri6.y3-tri6.y1)-(tri6.x3-tri6.x1)*(tri6.y2-tri6.y1))
     <= 50 && !tri1.active && !tri2.active && !tri3.active && !tri4.active && !tri5.active  && !tri7.active && !tri8.active && !tri9.active && !tri10.active && !diam1.active && !trap1.active && !diam2.active && !trap2.active || tri6.active == true)
     {
       tri6.active = true;
       moveTri6();
     }
     else if(abs((tri7.x1-mouseX)*(tri7.y2-mouseY)-(tri7.x2-mouseX)*(tri7.y1-mouseY))
    + abs((tri7.x2-mouseX)*(tri7.y3-mouseY)-(tri7.x3-mouseX)*(tri7.y2-mouseY))
    + abs((tri7.x3-mouseX)*(tri7.y1-mouseY)-(tri7.x1-mouseX)*(tri7.y3-mouseY)) //Source: Jeff Thompson (see citation at top)
    - abs((tri7.x2-tri7.x1)*(tri7.y3-tri7.y1)-(tri7.x3-tri7.x1)*(tri7.y2-tri7.y1))
     <= 50 && !tri1.active && !tri2.active && !tri3.active && !tri4.active && !tri5.active  && !tri6.active && !tri8.active && !tri9.active && !tri10.active && !diam1.active && !trap1.active && !diam2.active && !trap2.active || tri7.active == true)
     {
       tri7.active = true;
       moveTri7();
     }
     else if(abs((tri8.x1-mouseX)*(tri8.y2-mouseY)-(tri8.x2-mouseX)*(tri8.y1-mouseY))
    + abs((tri8.x2-mouseX)*(tri8.y3-mouseY)-(tri8.x3-mouseX)*(tri8.y2-mouseY))
    + abs((tri8.x3-mouseX)*(tri8.y1-mouseY)-(tri8.x1-mouseX)*(tri8.y3-mouseY)) //Source: Jeff Thompson (see citation at top)
    - abs((tri8.x2-tri8.x1)*(tri8.y3-tri8.y1)-(tri8.x3-tri8.x1)*(tri8.y2-tri8.y1))
     <= 50 && !tri1.active && !tri2.active && !tri3.active && !tri4.active && !tri5.active  && !tri6.active && !tri7.active && !tri9.active && !tri10.active && !diam1.active && !trap1.active && !diam2.active && !trap2.active || tri8.active == true)
     {
       tri8.active = true;
       moveTri8();
     }
     else if(abs((tri9.x1-mouseX)*(tri9.y2-mouseY)-(tri9.x2-mouseX)*(tri9.y1-mouseY))
    + abs((tri9.x2-mouseX)*(tri9.y3-mouseY)-(tri9.x3-mouseX)*(tri9.y2-mouseY))
    + abs((tri9.x3-mouseX)*(tri9.y1-mouseY)-(tri9.x1-mouseX)*(tri9.y3-mouseY)) //Source: Jeff Thompson (see citation at top)
    - abs((tri9.x2-tri9.x1)*(tri9.y3-tri9.y1)-(tri9.x3-tri9.x1)*(tri9.y2-tri9.y1))
     <= 50 && !tri1.active && !tri2.active && !tri3.active && !tri4.active && !tri5.active  && !tri6.active && !tri7.active && !tri8.active && !tri10.active && !diam1.active && !trap1.active && !diam2.active && !trap2.active || tri9.active == true)
     {
       tri9.active = true;
       moveTri9();
     }
     else if(abs((tri10.x1-mouseX)*(tri10.y2-mouseY)-(tri10.x2-mouseX)*(tri10.y1-mouseY))
    + abs((tri10.x2-mouseX)*(tri10.y3-mouseY)-(tri10.x3-mouseX)*(tri10.y2-mouseY))
    + abs((tri10.x3-mouseX)*(tri10.y1-mouseY)-(tri10.x1-mouseX)*(tri10.y3-mouseY)) //Source: Jeff Thompson (see citation at top)
    - abs((tri10.x2-tri10.x1)*(tri10.y3-tri10.y1)-(tri10.x3-tri10.x1)*(tri10.y2-tri10.y1))
     <= 50 && !tri1.active && !tri2.active && !tri3.active && !tri4.active && !tri5.active  && !tri6.active && !tri7.active && !tri8.active && !tri9.active && !diam1.active && !trap1.active && !diam2.active && !trap2.active || tri10.active == true)
     {
       tri10.active = true;
       moveTri10();
     }
}
