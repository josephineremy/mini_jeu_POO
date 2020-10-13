

class Game
attr_accessor :human_player, :ennemies

  def initialize(human_name)
    @human=HumanPlayer.new(human_name)
    @enemies=create_player
  end

  def create_player
    enemies=[]
    4.times do
    enemies << Player.new(("a".."z").to_a.sample(8).join)
  end
    return enemies
  end

  def kill_player
    @enemies.each do |player|
      if player.life_points<=0
        @enemies.delete(player)
      end
    end
  end

  def is_still_ongoing?
    true ? @human.life_points > 0 && @enemies.length > 0 : false
  end

  def show_players
    puts @human.show_state
    puts "Il reste #{@enemies.length} ennemis à tuer."
    puts "\n"
    puts "==========================="
    puts "\n"
  end

  def menu
    puts "Quelle action veux-tu effectuer?"
    puts "\n"
    puts "a - chercher une meilleure arme"
    puts "s - chercher à se soigner"
    puts "\n"
    puts "Attaquer un joueur en vue:"
    puts "\n"
    i=0
    @enemies.each do |player|
    print "#{i} - "
    print player.show_state
    i+=1
    end
  end

  def menu_choice(action)
    puts "\n"
    puts "==========================="
    puts "\n"
    puts "Sélectionne une action:"
    puts "\n"
    action=gets.chomp.to_s
    kill_player
    case action
    when "a"
      @human.search_weapon
    when "s"
      @human.search_health_pack
    else
      @human.attacks(@enemies[action.to_i])
    end
  end

  def enemies_attack
    puts "\n"
    puts "==========================="
    puts "\n"

    puts "LES ENNEMIS T'ATTAQUEEEEEENT !"
    puts "\n"

    @enemies.each do |player|
      if player.life_points>0
        puts player.attacks(@human)
      elsif player.life_points<=0
        puts "Bah #{player.name} est mort"
        puts "\n"
      end
    end
    puts "==========================="
    puts "\n"
  end

  def ending
    puts "\n"
    puts "==========================="
    puts "\n"
    puts "La partie est finie."
    puts "\n"
    puts "==========================="
    puts "\n"

    if @human.life_points>0
      puts "BRAVO ! TU AS GAGNE !"
    else
      puts "Loser, t'es mort alors que t'avais 100 points..."
    end
  end
end
