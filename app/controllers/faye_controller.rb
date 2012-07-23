class FayeController < ApplicationController
  def new
    @pole_race = PoleRace.new
    @pole_race.start
    @message = 'Done with race.'
  end
end