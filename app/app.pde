Puzzle[] puzzles;
Enemy enemy;
Player player;
PImage ENEMY;

int situation;
int situ1cnt;
int selected1,selected2;
boolean matched;
boolean enemyturn;

void setup(){
  size(450,800);
  background(200);
  ENEMY = loadImage("enemy4.png");
  situation=0;
  puzzles = new Puzzle[25];
  enemy = new Enemy();
  player = new Player();
  selected1 = selected2 = -1;
  matched = false;
  enemyturn = false;
  for(int i = 0; i < puzzles.length; i++){
    puzzles[i] = new Puzzle(i/5,i%5);
  }
}

void draw(){
  background(200);
  player.paint();
  enemy.paint();
  for(int i = 0; i < puzzles.length; i++){
     puzzles[i].paint();
  }
  
  if(player.getHP() == 0 || enemy.getHP() == 0){
    gameover();
  }
  else if(situation == 1){  //落下処理
    gravity(puzzles);
    supply(puzzles);
    situ1cnt++;
    if(situ1cnt > 5){
      situ1cnt = 0;
      situation = 0;
    }
    delay(200);
  }
  else if(situation == 0){  //消えるパズルがあるか確認
    matched=false;
    for(int i = 0; i < puzzles.length; i++){
       puzzles[i].findMatch(puzzles);
       if(puzzles[i].getMatched()){
         matched = true;
       }
    }
    if(matched){
      for(int i = 0; i < puzzles.length; i++){
       puzzles[i].remove();
      }
      situation = 1;
      delay(200);
    }
    else if(enemyturn){
      enemy.attack(player);
      enemyturn = false;
    }
  }
}

void mousePressed(){
  if(player.getHP() == 0 || enemy.getHP() == 0){
    if ( mouseX >= 125 && mouseX <= 125 + 75 && mouseY >= 550 && mouseY <= 550 + 25 ){
      setup();
    }
    if ( mouseX >= 240 && mouseX <= 240 + 75 && mouseY >= 550 && mouseY <= 550 + 25 ){
      exit();
    }
  }
  for(int i = 0; i < puzzles.length; i++){
     if(puzzles[i].selected()){
       if(selected1 == -1){
         selected1=i;
       }
       else if(selected2 == -1){
         selected2=i;
         int tmp=puzzles[selected1].getElement();
         puzzles[selected1].setElement(puzzles[selected2].getElement());
         puzzles[selected2].setElement(tmp);
         selected1=selected2=-1;
         situation = 0;
         enemyturn = true;
       }
     }
  }
}

void gravity(Puzzle[] puzzles){
  for(int i = 0; i < 5; i++){
    for(int j = 4; j > 0; j--){
      if(puzzles[i*5+j].getElement() == -1){
        puzzles[i*5+j].setElement(puzzles[i*5+j-1].getElement());
        puzzles[i*5+j-1].setElement(-1);
      }
    }
  }
}

void supply(Puzzle[] puzzles){
  for(int j = 0; j < 5; j++){
    if(puzzles[j*5].getElement() == -1){
      puzzles[j*5].setElement((int)random(5));
    }
  }
}

void gameover(){
  fill(250, 0, 0);
  rect(100,450,250,175);
  fill(0,255,0);
  rect(125,550,75,25);
  rect(240,550,75,25);
  textSize(50);
  fill(255,255,255);
  text("next game?",110,500);
  textSize(25);
  fill(0,0,0);
  text("next",135,570);
  text("quit",250,570);
}
