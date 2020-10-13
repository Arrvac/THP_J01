class Player
  attr_accessor :name, :life_points
  def initialize(name)
    @name = name
    @life_points = 10
  end

  def show_state
    puts "#{@name} a #{@life_points} points de vie et une arme de niveau #{@weapon_level}"
  end

  def attacks(player2)
    puts "Le joueur #{@name} attaque le joueur #{player2.name}"
    attk = compute_damage
    player2.gets_damage(attk)
    puts "Il lui inflige #{attk} points de dammages"
  end

  def compute_damage
    rand(1..6)
  end

  def gets_damage(nbr)
    if @life_points <= 0
      puts "#{@name} est déjà mort"
    else
      @life_points -= nbr
      @life_points = 0 if @life_points < 0
      puts "Le joueur #{@name} a été tué !" if @life_points <= 0
    end
  end
end

class HumanPlayer < Player
  attr_accessor :weapon_level

  def initialize(name)
    @life_points = 100
    @name = name
    @weapon_level = 1
  end

  def compute_damage
    rand(1..6) * @weapon_level
  end

  def search_health_pack
    heal = rand(1..6)
    if heal == 1
      puts 'Tu n\'as rien trouvé...'
    elsif heal >= 2 && heal <= 5
      puts 'Bravo, tu as trouvé un pack de +50 points de vie !'
      @life_points += 50
      @life_points = 100 if @life_points > 100
    else
      puts 'Waow, tu as trouvé un pack de +80 points de vie !'
      @life_points += 80
      @life_points = 100 if @life_points > 100
    end
  end

  def search_weapon
    niveau = rand(1..6)
    puts "tu as trouvé une arme de niveau #{niveau}"
    if @weapon_level < niveau
      puts "Youhou ! elle est meilleure que ton arme actuelle : tu la prends."
      @weapon_level = niveau
    elsif @weapon_level == niveau
      puts "M@*#$... elle n'est pas mieux que ton arme actuelle..."
    end
  end
end