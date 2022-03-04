class Grid_Square{
    int xCo, yCo;
    float x, y, squareWidth;
    int state, nextState;
    
    Grid_Square(int x, int y, int squareWidth){
        this.x = x;
        this.y = y;
        this.squareWidth = squareWidth;
        this.xCo = Math.round(x/squareWidth);
        this.yCo = Math.round(y/squareWidth);
        
        state = 0;
    }
    
    void Draw(){
        stroke(0);
        if (state == 1){
            fill(lerpColor(color(255, 0, 0), color(0, 255, 0), x/width ) + lerpColor(color(0, 0, 0), color(0, 0, 255), y/height ));
            stroke(lerpColor(color(255, 0, 0), color(0, 255, 0), x/width ) + lerpColor(color(0, 0, 0), color(0, 0, 255), y/height ));
        } else {
            stroke(0);
            fill(0);
        }
        
        if (squareWidth > 1){
            rect(x, y, squareWidth, squareWidth);
        } else {
            point(x, y);
        }
    }
    
    void setState(int state){
        this.state = state;
    }
    
    int getState(){
        return state;
    }
    
    int getXCo(){
        return xCo;
    }
    
    int getYCo(){
        return yCo;
    }
    
    boolean MouseIsOver(){
        return ((mouseX > x && mouseX < x + squareWidth) && (mouseY > y && mouseY < y + squareWidth));
    }
    
    int getNumberOfAliveCells(){
        int total = 0;
        if (getStateOfSquareAbove() == 1){
            total++;
        }
        
        if (getStateOfSquareDiagRightAbo() == 1){
            total++;
        }
        
        if (getStateOfSquareDiagLeftAbo() == 1){
            total++;
        }
        
        return total;
    }
    
    int getStateOfSquareAbove(){
        if (getYCo() != 0){
            return grid.getSquare(getXCo(), getYCo()-1).getState();
        }
        return -1;
    }
    
    int getStateOfSquareDiagRightAbo(){
        if (getXCo() != Math.round(width/squareWidth) - 1 && getYCo() != 0){
            try{
                return grid.getSquare(getXCo()+1, getYCo()-1).getState();
            } catch (Exception NullPointerException){
                return -1;
            }
        }
        return -1;
    }
    
    int getStateOfSquareDiagLeftAbo(){
        if (getXCo() != 0 && getYCo() != 0){
            return grid.getSquare(getXCo()-1, getYCo()-1).getState();
        }
        return -1;
    }
    
    void setNextState(int state){
        this.nextState = state;
    }
    
    int getNextState(){
        return nextState;
    }
}
