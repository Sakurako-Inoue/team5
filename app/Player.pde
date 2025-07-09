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
    rect(10,330,420,25);
    fill(0,255,0);
    rect(10,330,420*hp/max_hp,25);
    textSize(25);
    fill(0,0,0);
    text(hp+"/"+max_hp,10,350);
  }
}
