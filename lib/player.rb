class Player
  attr_accessor :name, :life_points

  def initialize(player_name)
    @name=player_name
    @life_points=10
  end

  def show_state
    puts "#{@name} a #{@life_points} points de vie"
  end

  def gets_damage(damage_points)
    @life_points = @life_points - damage_points
    if @life_points <= 0
      puts "Oups, le joueur #{@name} a été tué !"
    end
  end

  def attacks(player_attacked)
    begin
    puts "Le joueur #{@name} attaque le joueur #{player_attacked.name}"
    lost_points=compute_damage
    puts "Il lui inflige #{lost_points} points de dommages"
    player_attacked.gets_damage(lost_points)
    rescue
    end
  end

  def compute_damage
    return rand(1..6)
  end
end

class HumanPlayer < Player
  attr_accessor :weapon_level

  def initialize(player_name)
    @name=player_name
    @life_points=100
    @weapon_level=1
    end

    def show_state
      puts "Tu as #{@life_points} points de vie et une arme de niveau #{@weapon_level}"
    end

    def search_weapon
      puts "\n"
      puts "==========================="
      puts "\n"
      new_level=rand(1..6)
      puts "Tu as trouvé une arme de niveau #{new_level}"
      if new_level>@weapon_level
        puts "Youhou ! elle est meilleure que ton arme actuelle: tu la prends !"
        @weapon_level=new_level
      else new_level<=@weapon_level
        puts "M@*#$... elle n'est pas mieux que ton arme actuelle..."
      end
    end

    def search_health_pack
      puts "\n"
      puts "==========================="
      puts "\n"
      new_health_pack=rand(1..6)
      if new_health_pack==1
        puts "Tu n'as rien trouvé"
      elsif new_health_pack>=2 && new_health_pack<=5
        puts "Bravo, tu as trouvé un pack de +50 points de vie !"
        if @life_points>=50
          @life_points=100
        elsif @life_points<50
          @life_points += 50
        end
      else new_health_pack==6
        puts "Bravo, tu as trouvé un pack de +80 points de vie !"
        if @life_points>=20
          @life_points=100
        elsif @life_points<20
          @life_points += 80
        end
      end
    end

    def compute_damage
      return rand(1..6) * @weapon_level
    end

end
