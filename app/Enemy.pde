class Enemy extends Chara{
  
  Enemy(){
    super();
    if(stage==0){
      max_hp = 50 + (int)random(50);
      hp = max_hp;
      attack_point = 2 + (int)random(6);
    }
    else if(stage==1){
      max_hp = 75 + (int)random(100);
      hp = max_hp;
      attack_point = 5 + (int)random(6);
    }
    else if(stage==2){
      max_hp = 100 + (int)random(100);
      hp = max_hp;
      attack_point = 10 + (int)random(6);
    }
    else if(stage==3){
      max_hp = 100 + (int)random(100);
      hp = max_hp;
      attack_point = 15 + (int)random(6);
    }
    else if(stage==4){
      max_hp = 125 + (int)random(100);
      hp = max_hp;
      attack_point = 15 + (int)random(6);
    }
    else if(stage==5){
      max_hp = 150 + (int)random(100);
      hp = max_hp;
      attack_point = 20 + (int)random(6);
    }
  }
  
  void attack(Player player){
    player.setHP(player.getHP()-this.attack_point);
  }
  
  void paint(){
    fill(255, 0, 0);
    rect(100,10,250,10);
    fill(0,255,0);
    rect(100,10,250*hp/max_hp,10);
    image(BACK,0,25,700,300);
    image(ENEMY,75,25, 300, 300);
  }
}
