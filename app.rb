require 'bundler'
require 'pry'
Bundler.require

require_relative 'lib/game'
require_relative 'lib/player'

player1 = Player.new("Josiane")
player2 = Player.new("José")

puts "\n"
puts "==========================="
puts "\n"

puts "A ma droite, #{player1.name}"
puts "A ma gauche, #{player2.name}"

while player1.life_points>0 && player2.life_points>0 do

puts "\n"
puts "==========================="
puts "\n"

  puts "Voici l'état de chaque joueur:"
  puts "\n"
  puts player1.show_state
  puts player2.show_state

  puts "\n"
  puts "==========================="
  puts "\n"

  puts "Passons à la phase d'attaque !"
  puts "\n"

  puts player1.attacks(player2)
  puts "\n"
  if player2.life_points<=0
    break
  end
  puts "****************************"
  puts "\n"
  puts player2.attacks(player1)
end

binding.pry
