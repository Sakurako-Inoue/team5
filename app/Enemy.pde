class Enemy extends Chara{
  
  Enemy(){
    super();
    max_hp = 50 + (int)random(50);
    hp = max_hp;
    attack_point = 2 + (int)random(6);
  }
  
  void attack(Player player){
    player.setHP(player.getHP()-this.attack_point);
  }
  
  void paint(){
    fill(255, 0, 0);
    rect(100,10,250,10);
    fill(0,255,0);
    rect(100,10,250*hp/max_hp,10);
    image(ENEMY,75,25, 300, 300);
  }
}
