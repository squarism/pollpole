require 'json'

class RaceController < ApplicationController
  respond_to :html, :xml, :json
  
  def new
    respond_with @pole_race do |format|
      format.json {
        case params[:id]
        when 'delayed_job'
          @pole_race = PoleRace.new
          job = @pole_race.delay.start
          # we don't have a score id until later and we cannot set @pole_race
          # to be a constant (well I guess we could) because the HTML
          # view actually needs @pole_race to render
          render :json => {:job => job.id, :score_id => @pole_race.judge.score.id}.to_json
        end
      }
      format.html { 
        case params[:id]
        when 'faye'
          # not used, stop doing this style
        when 'polling'
          @pole_race = PoleRace.new
          flash[:notice] = "Started a race with dumb procedural blocking."
          @pole_race.start
        when 'delayed_job'
          flash[:notice] = "Started a race with delayed job in JS."
        when 'beanstalkd'
        end
      }
    end
  end
  
  def index
  end
  
  def show
    score = Score.find(params[:id])
    respond_with score do |format|
      format.json {
        render :json => score.to_json
      }
    end
  end

  def delete_all
    Score.delete_all
    flash[:notice] = "Deleted all scores."
    redirect_to :root
  end
  
end
