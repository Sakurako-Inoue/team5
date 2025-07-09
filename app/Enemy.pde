class Enemy extends Chara{
  
  Enemy(){
    super();
    hp = 50 + (int)random(50);
    attack_point = 2 + (int)random(6);
  }
  
  void attack(Player player){
    player.setHP(player.getHP()-this.attack_point);
  }
  
  void paint(){
    fill(0, 255, 255);
    image(TOKYO,0,0, 100, 100);
  }
}
