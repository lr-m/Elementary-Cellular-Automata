class Grid{
    Square_HashMap squares;
    ArrayList<Grid_Square> iterateSquares;
    int squareWidth;
    
    Grid(int squareWidth){
        this.squareWidth = squareWidth;
        squares = new Square_HashMap((int) ((width/squareWidth) * (gridHeight/squareWidth)));
        iterateSquares = new ArrayList();
        
        for(int i = 0; i < width/squareWidth; i++){
            for(int j = 0; j < gridHeight/squareWidth; j++){
                Grid_Square square = new Grid_Square(i*squareWidth, j*squareWidth, squareWidth);
                iterateSquares.add(square);
                squares.addSquare(square);
            }
        }
    }
    
    void Draw(){
        rectMode(CORNER);
        for (Grid_Square square: iterateSquares){
            if (square.getYCo() == sierpRow-1){
                square.Draw();
            }
        }
    }
    
    Grid_Square getSquare(int xCo, int yCo){
        return squares.getSquare(xCo, yCo);
    }
    
    void checkSquaresForMouse(){
        for (Grid_Square square : iterateSquares){
            if (square.MouseIsOver()){
                square.setState(1);
            }
        }
    }
    
    void sierpinskiIterate(){
      if ((sierpRow == (int) ((height-80)/squareWidth)) || ((width/squareWidth)/2 + sierpRow) > width/squareWidth){
        return;
      }
      
      if (sierpRow == 0){
        getSquare((int) (width/squareWidth)/2, 0).setState(1);
        sierpRow++;
        return;
      }
      
      for (int i = 0; i < width/squareWidth; i++){
        Grid_Square square = getSquare(i, sierpRow);
        
        String aboveState = getSierpState(square);
        ArrayList<Integer> states = selector.getStates();
        
        if (aboveState.equals("000")){
          square.setState(states.get(7));
        } else if (aboveState.equals("001")){
          square.setState(states.get(6));
        } else if (aboveState.equals("010")){
          square.setState(states.get(5));
        } else if (aboveState.equals("011")){
          square.setState(states.get(4));
        } else if (aboveState.equals("100")){
          square.setState(states.get(3));
        } else if (aboveState.equals("101")){
          square.setState(states.get(2));
        } else if (aboveState.equals("110")){
          square.setState(states.get(1));
        } else if (aboveState.equals("111")){
          square.setState(states.get(0));
        }
      }
      sierpRow++;
    }
    
    String getSierpState(Grid_Square square){
      int diagLeft = square.getStateOfSquareDiagLeftAbo();
      int abo = square.getStateOfSquareAbove();
      int diagRight = square.getStateOfSquareDiagRightAbo();
      
      return Integer.toString(diagLeft) + Integer.toString(abo) + Integer.toString(diagRight);
    }
    
    void conwayIterate(){
        for (Grid_Square square : iterateSquares){
            int numAlive = square.getNumberOfAliveCells();
            
            if (square.getState() == 1 && numAlive < 2){
                square.setNextState(0);
            } else if (square.getState() == 1 && numAlive > 3){
                square.setNextState(0);
            } else if (square.getState() == 1 && (numAlive == 2 || numAlive == 3)){
                square.setNextState(1);
            } else if (square.getState() == 0 && (numAlive == 3)){
                square.setNextState(1);
            } else {
                square.setNextState(0);
            }
        }
        
        update();
    }
    
    void update(){
        for (Grid_Square square : iterateSquares){
            if (square.getState() != square.getNextState()){
                square.setState(square.getNextState());
            }
        }
    }
    
    void randomState(){
        for(Grid_Square square : iterateSquares){
            float rand = random(0, 10);
            if (rand < 2){
                square.setState(1);
            }
            else {
                square.setState(0);
            }
        }
    }
    
    void clearGrid(){
        for(Grid_Square square : iterateSquares){
            square.setState(0);
        }
    }
}
