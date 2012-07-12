require 'observer'

class Racer
  include Observable
  attr_reader :finished, :started, :time, :name
  
  def initialize
    @name = ['Susie', 'Samuel', 'Sandy', 'Steven', 'Samone', 'Stefan'].sample
    @finished = false
    @started = false
  end
  
  def race(flagpole_length)
    t1 = Time.now
    @started = true
    changed
    notify_observers self
    puts "#{@name}: I'm racing up the pole!"

    sleep flagpole_length

    @finished = true
    @time = Time.now - t1   # true time elapsed
    changed
    
    puts "#{@name}: I rang the bell."
    notify_observers self
  end
  
end