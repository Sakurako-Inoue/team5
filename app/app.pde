Puzzle[] puzzles;
Enemy enemy;
Player player;
PImage TOKYO;

int situation;
int situ1Cnt;
int selected1,selected2;


void setup(){
  size(450,800);
  background(200);
  TOKYO = loadImage("TOKYO.png");
  situation=0;
  puzzles = new Puzzle[25];
  enemy = new Enemy();
  player = new Player();
  selected1 = selected2 = -1;
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
  if(situation == 1){  //落下処理
    gravity(puzzles);
    supply(puzzles);
    situ1Cnt++;
    if(situ1Cnt > 5){
      situ1Cnt = 0;
      situation = 0;
    }
    delay(200);
  }
  else if(situation == 0){  //消えるパズルがあるか確認
    for(int i = 0; i < puzzles.length; i++){
       puzzles[i].findMatch(puzzles);
    }
    for(int i = 0; i < puzzles.length; i++){
       puzzles[i].remove();
    }
    situation = 1;
    delay(200);
  }
}

void mousePressed(){
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
