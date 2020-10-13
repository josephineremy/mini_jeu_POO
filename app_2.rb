require 'bundler'
Bundler.require

require_relative 'lib/game'
require_relative 'lib/player'


puts "\n"
puts "-------------------------------------------------"
puts "|Bienvenue sur 'ILS VEULENT TOUS MA POO' !      |"
puts "|Le but du jeu est d'être le dernier survivant !|"
puts "-------------------------------------------------"
puts "\n"

puts "Quel est ton nom de joueur?"
print ">"
name=gets.chomp
human_player1 = HumanPlayer.new(name)
puts "\n"
puts "Ton identifiant combattant a bien été créé, #{name} !"
puts "\n"
player1 = Player.new("Joker")
player2 = Player.new("Luthor")
enemies=[]
enemies << player1
enemies << player2



while player1.life_points>0 || player2.life_points>0 && human_player1.life_points>0 do

puts "\n"
puts "==========================="
puts "\n"

  puts "Voici ton état de survie:"
  puts "\n"
  puts human_player1.show_state
  puts "\n"
  puts "==========================="
  puts "\n"

  puts "Quelle action veux-tu effectuer?"
  puts "\n"
  puts "a - chercher une meilleure arme"
  puts "s - chercher à se soigner"
  puts "\n"
  puts "attaquer un joueur en vue"
  print "1 - "
  print player1.show_state
  print "2 - "
  print player2.show_state
  question=gets.chomp.to_s
  case question
  when "a"
    puts "\n"
    puts "==========================="
    puts "\n"
      human_player1.search_weapon
      puts "\n"
      puts "==========================="
      puts "\n"
    when "s"
      puts "\n"
      puts "==========================="
      puts "\n"
      human_player1.search_health_pack
      puts "\n"
      puts "==========================="
      puts "\n"
    when "1"
      puts "\n"
      puts "==========================="
      puts "\n"
      puts human_player1.attacks(player1)
      puts "\n"
      puts "==========================="
      puts "\n"
    when "2"
      puts "\n"
      puts "==========================="
      puts "\n"
      puts human_player1.attacks(player2)
      puts "\n"
      puts "==========================="
      puts "\n"
    end

  puts "\n"
  puts "==========================="
  puts "\n"

  puts "Les autres t'attaquent !"
  puts "\n"

  enemies.each do |player|
    if player.life_points>0
      puts player.attacks(human_player1)
    elsif player.life_points<=0
      puts "Bah #{player.name} est mort"
    end
  end

end
puts "\n"
puts "==========================="
puts "\n"
puts "La partie est finie."
puts "\n"
puts "==========================="
puts "\n"

if human_player1.life_points>0
  puts "BRAVO ! TU AS GAGNE !"
else
  puts "Espèce de gros loser, t'es mort alors que t'avais 100 points"
end
