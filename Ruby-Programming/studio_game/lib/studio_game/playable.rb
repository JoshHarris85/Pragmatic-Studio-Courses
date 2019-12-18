module StudioGame
  module Playable
    def strong?
      self.health > 100
    end

    def blam
      self.health -= 10
      puts "#{self.name} got blammed!"
    end

    def woot
      self.health += 15
      puts "#{self.name} got w00ted!"
    end
  end
end
