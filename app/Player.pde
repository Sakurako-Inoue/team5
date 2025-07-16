class Player extends Chara{

  Player(){
    super();
    max_hp = 100;
    hp = max_hp;
    attack_point = 10;
  }
  
  void attack(Enemy enemy){
    enemy.setHP(enemy.getHP()-this.attack_point);
  }
  
  void paint(){
    fill(255,0,0);
    rect(8,264,336,20);
    fill(0,255,0);
    rect(8,264,336*hp/max_hp,20);
    textSize(20);
    fill(0,0,0);
    text(hp+"/"+max_hp,8,280);
  }
}
