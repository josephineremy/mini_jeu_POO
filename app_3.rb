require 'bundler'
Bundler.require

require_relative 'lib/game'
require_relative 'lib/player'
action=""
@enemies=[]

  puts "\n"
  puts "-------------------------------------------------"
  puts "|Bienvenue sur 'ILS VEULENT TOUS MA POO' !      |"
  puts "|Le but du jeu est d'être le dernier survivant !|"
  puts "-------------------------------------------------"
  puts "\n"


  puts "Quel est ton nom de joueur?"
  print ">"
  human_name=gets.chomp!

  my_game=Game.new(human_name)
  puts "\n"
  puts "==========================="
  puts "\n"
  my_game.show_players
  puts "\n"
  puts "==========================="
  puts "\n"

  while my_game.is_still_ongoing?
  my_game.menu
  my_game.menu_choice(action)
  my_game.enemies_attack
  my_game.show_players
  end

my_game.ending
