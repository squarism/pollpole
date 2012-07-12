class JobController < ApplicationController
  respond_to :html, :xml, :json
  
  def new
    @pole_race = PoleRace.new
    
    case params[:id]
    when 'faye'
    when 'polling'
      @pole_race.start
    when 'delayed_job'
    when 'beanstalkd'
    else
      raise "Don't hack the Gibson.  Pass a real job type."
    end
      
    #respond_with(@job_id = params[:id])
  end
  
end
