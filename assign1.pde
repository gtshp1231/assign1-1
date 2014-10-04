SlotMachine machine;
boolean rolling = false;
// button information
boolean button = false;
int x = 640/2;
int y = 440;
int w = 150;
int h = 50;

// declare variables
// --------------------------------------------
// put your code inside here
int totalScore = 500;



// --------------------------------------------

void setup() {
  size(640,480);
  textFont(createFont("fonts/Square_One.ttf", 20));
  machine = new SlotMachine();
}

void draw() {
  background(245,229,124);
  fill(64,162,171);
  rect(320,248,396,154,25);
  fill(253,253,253);
  rect(220,247,97,114,2);
  rect(320,247,97,114,2);
  rect(420,247,97,114,2);
  // draw button
  fill(64,162,171);
  noStroke();
  rectMode(CENTER);
  rect(x,y,w,h,105);
  // show title
  fill(64,64,63);
  textAlign(CENTER, CENTER);
  textSize(32);
  text("Slot Machine",x,49);
  textSize(20);
  text("Score"+" "+":"+" "+totalScore,x, 89);
  
  // event handler
  if (button) {
    if (!rolling){
      rolling = true;
      // start rolling
      // -------------------------------------------------
      // put your code inside here
        totalScore -= 50;

        
      
      // -------------------------------------------------
    }
    machine.roll();
    textSize(19);
    text("Stop",x,y);
  
  } else {
    if (rolling){
      rolling = false;
      // stop rolling
      // -------------------------------------------------
      // put your code inside here
        int result = machine.probability(0.9); // The probability of "0" is 10%.
        int a = int(random(5)) + result; // Choose the fruits randomly, and it may come out to be "0"(10%) or "1"(90%).
        int b = int(random(5)) + result; // If result = 1, fruitId = 1~5. If result = 0, fruitId = 0~4.
        int c = int(random(5)) + result; // It means the probability of lucky seven's appearance is 10%.
        machine.setSlotFruit(0,a); // set fruits into each slots
        machine.setSlotFruit(1,b);
        machine.setSlotFruit(2,c);
        float m = sq(machine.getFruitCount(0)) * 60; // (the number of fruits) * (multiple) * (score)
        float n = sq(machine.getFruitCount(1)) * 10;
        float o = sq(machine.getFruitCount(2)) * 20;
        float p = sq(machine.getFruitCount(3)) * 30;
        float q = sq(machine.getFruitCount(4)) * 40;
        float r = sq(machine.getFruitCount(5)) * 50;
        totalScore += m + n + o + p + q + r; // plus all scores
        
 
      
      // ------------------------------------------------
    }
    machine.stop();
    fill(253,253,253);
    textSize(19);
    text("Roll",x,y);
  }

}

// When the mouse is pressed, the state of the button is toggled.   
void mousePressed() {
  if (mouseX > x-w/2 && mouseX < x+w/2 && mouseY > y-h/2 && mouseY < y+h/2) {
    button = !button;
  }  
}






