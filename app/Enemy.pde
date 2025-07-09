class Enemy extends Character{
  
  Enemy(){
    super();
    hp = 50 + (int)random(50);
    attack_point = 2 + (int)random(6);
  }
  
  void attack(Player player){
    player setHP(player getHP()-this.attack_point);
    
  }
  
  int getHP(){
    suoer();
  }
  
  void setHP(int hp){
    super();
  }
