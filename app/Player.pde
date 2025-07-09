class Player extends Chara{

  Player(){
    super();
    hp = 100;
    attack_point = 10;
  }
  
  void attack(Enemy enemy){
    enemy.setHP(enemy.getHP()-this.attack_point);
  }
}
