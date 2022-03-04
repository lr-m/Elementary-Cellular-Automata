class Square_HashMap{    
    ArrayList<ArrayList<Grid_Square> > squares =  new ArrayList<ArrayList<Grid_Square> >();
    
    Square_HashMap(int capacity){
        for (int i = 0; i < capacity; i++){
            squares.add(new ArrayList<Grid_Square>());
        }
    }
    
    void addSquare(Grid_Square square){
        squares.get(getKey(square)).add(square);
    }
    
    int getKey(Grid_Square square){
        return square.getXCo() * square.getYCo();
    }
    
    int getKey(int xCo, int yCo){
        return xCo * yCo;
    }
    
    Grid_Square getSquare(int xCo, int yCo){
        int hashKey = getKey(xCo, yCo);
        
        ArrayList<Grid_Square> found = squares.get(hashKey);
        
        if (found.size() == 1){
            return found.get(0);
        } else {
            for (Grid_Square square : found){
                if(square.getXCo() == xCo && square.getYCo() == yCo){
                    return square;
                }
            }
        }
        return null;
    }
}
