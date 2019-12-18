require_relative 'auditable'

module StudioGame
  class Die
    include Auditable

    attr_accessor :number

    def initialize
      roll
    end

    def roll
      @number = rand(1..6)
      audit
      @number
    end
  end
end
