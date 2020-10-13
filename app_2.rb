require 'bundler'
Bundler.require

require_relative 'lib/game'
require_relative 'lib/player'

puts '========================================='
puts '||                                     ||'
puts '||             Bienvenue               ||'
puts '||       DANS LE JEU DE LA MORT        ||'
puts '||                                     ||'
puts '========================================='
puts

print 'Donne moi ton nom jeune entrepreneur: '
user_name = gets.chomp
puts
enemies = Array.new
player1 = HumanPlayer.new(user_name)
enemies[0] = Player.new('Josiane')
enemies[1] = Player.new('José')

while player1.life_points.positive? && (enemies[0].life_points.positive? || enemies[1].life_points.positive?)
  puts 'Quelle action veux-tu effectuer ?'
  puts
  puts 'a - chercher une meilleure arme'
  puts 's - chercher à se soigner'
  puts
  puts 'attaquer un joueur en vue :'
  puts "0 - Josiane a #{enemies[0].life_points} points de vie"
  puts "1 - José a #{enemies[1].life_points} points de vie"
  puts
  puts '========================================='
  print '> '
  index = gets.chomp
  print '> '
  player1.search_weapon if index == 'a'
  player1.search_health_pack if index == 's'
  player1.attacks(enemies[0]) if index == '0'
  player1.attacks(enemies[1]) if index == '1'
  gets.chomp
  puts 
  puts "Les autres joueurs t'attaquent !"
  gets.chomp
  puts
  enemies.each do |enem|
    print '< '
    enem.attacks(player1) if enem.life_points.positive?
    gets.chomp
  end
  puts '========================================='
  puts
end

if player1.life_points.positive?
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