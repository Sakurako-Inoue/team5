Puzzle[] puzzles;
Enemy enemy;
Player player;
PImage ENEMY;
PImage BACK;
PImage DISPLAY;
PImage WIN;
PImage LOSE;

int situation;
int situ1cnt;
int selected1,selected2;
boolean matched;
boolean enemyturn;
int stage=0;
int max_stage=5;

void setup(){
  size(360,640);
  background(200);
  DISPLAY = loadImage("文字背景.png");
  if(stage==0){
    ENEMY = loadImage("enemy4.png");
    BACK = loadImage("背景1.png");
  }
  else if(stage==1){
    ENEMY = loadImage("enemy2.png");
    BACK = loadImage("背景1.png");
  }
  else if(stage==2){
    ENEMY = loadImage("enemy1.png");
    BACK = loadImage("背景1.png");
  }
  else if(stage==3){
    ENEMY = loadImage("enemy6.png");
    BACK = loadImage("背景2.png");
  }
  else if(stage==4){
    ENEMY = loadImage("enemy3.png");
    BACK = loadImage("背景2.png");
  }
  else if(stage==5){
    ENEMY = loadImage("enemy5.png");
    BACK = loadImage("背景2.png");
  }
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
    if ( mouseX >= 108 && mouseX <= 108 + 60 && mouseY >= 456 && mouseY <= 456 + 20 ){
      if(enemy.getHP() == 0){
        stage++;
      }
      if(stage>max_stage){
        stage=0;
      }
      setup();
    }
    if ( mouseX >= 200 && mouseX <= 200 + 60 && mouseY >= 456 && mouseY <= 456 + 20 ){
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
  image(DISPLAY,40,320,280,240);
  fill(0,255,0);
  rect(100,470,60,20);
  fill(255,0,0);
  rect(192,470,60,20);
  textSize(40);
  fill(0,0,0);
  if(enemy.getHP() == 0){
    WIN = loadImage("youwin.png");
    image(WIN,85, 370, 200, 100);
  }
  else{
    LOSE = loadImage("youlose.png");
    image(LOSE,80, 360, 240, 120);
  }
  textSize(20);
  fill(0,0,0);
  text("next",108,485);
  text("quit",200,485);
}
