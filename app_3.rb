require 'bundler'
Bundler.require

require_relative 'lib/game'
require_relative 'lib/player'

puts 'Initialisation du joueur :'
print 'Quel est ton nom de joueur > '
my_game = Game.new(gets.chomp)

my_game.start
while my_game.is_still_ongoing?
    my_game.menu
    my_game.menu_choice(gets.chomp)
    puts '========================================='
    my_game.enemies_attack
    puts '========================================='
    gets.chomp
    my_game.show_players
    puts '========================================='
    gets.chomp
end
my_game.end
