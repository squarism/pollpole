class Judge
  attr_reader :name, :time, :score
  
  def initialize
    @name = ['Judy', 'Jackson', 'Jarvis', 'Joan', 'Joey', 'Jean', 'Joe', 'Jill'].sample
    @score = Score.new
    @score.save
  end
  
  def update(racer)
    if racer.started == true && racer.finished == false
      puts "#{@name}: I just saw #{racer.name} take off."
      @t1 = Time.now
    elsif racer.started == true && racer.finished == true
      puts "#{@name}: I heard #{racer.name.possessive} bell ring."
      @time = Time.now - @t1
      self.post_score(racer)
    end
  end
  
  def post_score(racer)
    @score.time = @time
    @score.judge = @name
    @score.racer = racer.name
    @score.save
  end
  
end