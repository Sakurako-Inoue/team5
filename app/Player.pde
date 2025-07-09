class Player extends Character{

  Player(){
    super();
    hp = 100;
    attack_point = 10;
  }
  
  void attack(Enemy enemy){
    enemy.setHP(enemy.getHP()-this.attack_point);
  }
  
  int getHP(){
    super();
  }
  void setHP(int hp){
    super();
  }
}
