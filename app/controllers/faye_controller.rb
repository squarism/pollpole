class FayeController < ApplicationController
  respond_to :html, :xml, :json

  def index
    @scores = Score.all
  end

  def new
    @pole_race = PoleRace.new
    @pole_race.start
    @score = @pole_race.judge.score
  end

end