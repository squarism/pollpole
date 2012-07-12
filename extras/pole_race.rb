require 'observer'

class PoleRace
  attr_reader :racer, :judges
  
  def initialize
    @racer = Racer.new
    @judges = [ ]
    1.times { @judges << Judge.new }
  end
  
  def start
    @judges.each do |j|
      @racer.add_observer j
    end
    @racer.race(rand(5)+1)
  end
  
end
