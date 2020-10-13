require 'pry'

class Game
 attr_accessor :human_player, :enemies
 def initialize(name)
    @human_player = HumanPlayer.new(name)
    @enemies = Array.new
    4.times do |i|
        @enemies[i] = Player.new("Player#{i}")
    end
 end

 def kill_player(player)
    @enemies.delete(player)
 end

 def is_still_ongoing?
    (@human_player.life_points.positive? && @enemies.any?)
 end

 def show_players
    @human_player.show_state
    puts "Il reste #{@enemies.length} bots restants"
 end

 def menu
    puts 'Quelle action veux-tu effectuer ?'
    puts
    puts 'a - chercher une meilleure arme'
    puts 's - chercher à se soigner'
    puts
    puts 'attaquer un joueur en vue :'
    @enemies.each { |p| puts "#{@enemies.index(p) + 1} - #{p.name} a #{p.life_points} points de vie" if p.life_points.positive?}
 end

 def menu_choice(choice)
    case choice
    when "a" then @human_player.search_weapon
    when "s" then @human_player.search_health_pack 
    else
        @human_player.attacks(@enemies[choice.to_i - 1]) if choice.to_i != 0 && @enemies[choice.to_i - 1]
    end
    @enemies.each {|p| kill_player(p) if p.life_points <= 0}
 end

 def enemies_attack
    @enemies.each {|p| p.attacks(@human_player) if p.life_points > 0}
 end

 def end
    if human_player.life_points.positive?
        puts '========================================='
        puts '||                                     ||'
        puts '||             GOOD JOBS               ||'
        puts '||                                     ||'
        puts '========================================='
        puts
    else
        puts '========================================='
        puts '||                NUL                  ||'
        puts '========================================='
    end
 end

 def start
    puts
    puts '========================================='
    puts '||                                     ||'
    puts '||             Bienvenue               ||'
    puts '||       DANS LE JEU DE LA MORT        ||'
    puts '||                                     ||'
    puts '========================================='
    puts
 end
end