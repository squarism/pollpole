class Judge
  attr_reader :name, :time
  
  def initialize
    @name = ['Judy', 'Jackson', 'Jarvis', 'Joan', 'Joey', 'Jean', 'Joe', 'Jill'].sample
  end
  
  def update(racer)
    if racer.started == true && racer.finished == false
      puts "#{@name}: I just saw #{racer.name} take off."
      @t1 = Time.now
    elsif racer.started == true && racer.finished == true
      puts "#{@name}: I heard #{racer.name.possessive} bell ring."
      @time = Time.now - @t1
    end
  end
  
end