class State_Selector{
    ArrayList<Integer> states;
    ArrayList<Button> buttons;
    
    State_Selector(){
        states = new ArrayList();
        
        for (int i = 0; i < 8; i++){
            states.add(0);
        }
        
        buttons = new ArrayList();
    }
    
    int start = width-540;
    
    void Draw(){
        fill(255);
        rect(width-587, height-70, 540, 60, 25); 
        fill(0);
        text("111", start, height-50);
        text("110", start+60, height-50);
        text("101", start+120, height-50);
        text("100", start+180, height-50);
        text("011", start+240, height-50);
        text("010", start+300, height-50);
        text("001", start+360, height-50);
        text("000", start+420, height-50);
        
        for (int i = width-552; i < width-100; i+=60){
            buttons.add(new Button("", i, height-40, 50, 20));
        }
        
        for (int i = 0; i < 8; i++){
            DrawState(buttons.get(i), states.get(i));
        }
    }
    
    void checkButtons(){
        for (int i = 0; i < 8; i++){
            if (buttons.get(i).MouseIsOver()){
                if (states.get(i)==0){
                    states.set(i, 1);
                    break;
                } else if (states.get(i)==1){
                    states.set(i, 0);
                    break;
                }
            }
        }
    }
    
    ArrayList<Integer> getStates(){
        return states;
    }
}
