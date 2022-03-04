Grid grid;
boolean started = false;

int gridHeight;
int squareWidth;
int oldSquareWidth;

int sierpRow = 0;

Slider sizeSlider;

State_Selector selector;

void reset(){
  sierpRow = 0;
  started = false;
  clear();
  grid.clearGrid();
}

void setup(){
    fullScreen();
    gridHeight = height-80;
    
    sizeSlider = new Slider(50, height - 40, (width/2) - 100, 16, 1, 25);
    
    squareWidth = (int) sizeSlider.getValue();
    oldSquareWidth = squareWidth;
    
    grid = new Grid(squareWidth);
    grid.clearGrid();
    
    selector = new State_Selector();
    
    background(0);
}

void draw(){   
    squareWidth = (int) sizeSlider.getValue();
    
    if (squareWidth != oldSquareWidth && !started){
        oldSquareWidth = squareWidth;
        grid = new Grid(squareWidth);
        reset();
    }

    frameRate(60);
    if (started){
        grid.sierpinskiIterate();
    }
    grid.Draw();
    
    sizeSlider.display();
    
    selector.Draw();
}

void keyPressed(){
    if (key == ' '){
        started = !started;
    }
    
    if (key == 'r'){
        reset();
    }
    
    if (key == 'c'){
        grid.clearGrid();
        started = false;
    }
}

void mousePressed(){
    if (!started){
        selector.checkButtons();
    }
    sizeSlider.press();
}

void mouseReleased(){
     sizeSlider.release();   
}

void DrawState(Button but, int state){
    if (state == 0){
        but.Draw();
    } else if (state == 1){
        but.drawSelected();
    }
}
