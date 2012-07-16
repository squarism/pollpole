require 'observer'

class PoleRace
  attr_reader :racer, :judge
  
  def initialize
    @racer = Racer.new
    @judge = Judge.new
  end
  
  def start
    @racer.add_observer @judge
    @racer.race(rand(5)+1)
  end
  
end
