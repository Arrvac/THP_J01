require 'bundler'
Bundler.require

require_relative 'lib/game'
require_relative 'lib/player'

player1 = Player.new('Josiane')
player2 = Player.new('José')

round = 0
while player1.life_points.positive? && player2.life_points.positive?
  puts "----------Round #{round}----------"
  puts "Voici l'état de chaque joueur:"
  player1.show_state
  player2.show_state
  puts
  puts "Passons à la phase d'attaque :"
  player2.attacks(player1)
  player1.attacks(player2) if player1.life_points.positive?
  puts '---------------------------'
  puts
  round += 1
end
