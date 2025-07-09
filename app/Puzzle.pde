class Puzzle{
  private int x,y;
  private int pos_x,pos_y;
  private int r;
  private int element;
  private boolean matched;
  
  Puzzle(int x,int y){
    this.x = x;
    this.y = y;
    r = 75;
    matched = false;
    element = (int)random(5);
  }
  
  void paint(){
    if(element == 0){
      fill(255, 0, 0);
    }
    else if(element == 1){
      fill(0, 255, 0);
    }
    else if(element == 2){
      fill(0, 0, 255);
    }
    else if(element == 3){
      fill(255, 255, 0);
    }
    else if(element == 4){
      fill(255, 0, 255);
    }
    else{
      fill(255,255,255);
    }
    pos_x = 50+x*85;
    pos_y = 400+y*85;
    ellipse(pos_x, pos_y, r, r);
  }
  
  void setMatched(boolean matched){
    this.matched = matched;
  }
  
  boolean getMatched(){
    return this.matched;
  }
    
  int getElement(){
    return this.element;
  }
  void setElement(int element){
    this.element = element;
  }
  
  void findMatch(Puzzle[] puzzles){
    if(x > 0 && x < 4 && this.element != -1){
      if(this.element == puzzles[(x-1)*5+y].getElement() && this.element == puzzles[(x+1)*5+y].getElement()){
        puzzles[(x-1)*5+y].setMatched(true);
        this.matched = true;
        puzzles[(x+1)*5+y].setMatched(true);
        player.attack(enemy);
      } 
    }
    if(y > 0 && y < 4 && this.element != -1){
      if(this.element == puzzles[x*5+y-1].getElement() && this.element == puzzles[x*5+y+1].getElement()){
        puzzles[x*5+y-1].setMatched(true);
        this.matched = true;
        puzzles[x*5+y+1].setMatched(true);
      } 
    }
  }
  
  void remove(){
    if(this.matched){ 
      this.element = -1;
      this.matched = false;
    }
  }
  
  
  boolean selected(){
    if((mouseX-pos_x)*(mouseX-pos_x) + (mouseY-pos_y)*(mouseY-pos_y) < (r/2)*(r/2)){
      noFill();
      rect(pos_x-r/2,pos_y-r/2,r,r);
      return true;
    }
    else{
      return false;
    }
  }
}
