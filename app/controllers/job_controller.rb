class JobController < ApplicationController
  respond_to :html, :xml, :json
  
  def new
    @pole_race = PoleRace.new
    
    respond_with @pole_race do |format|
      format.js {
        case params[:id]
        when 'delayed_job'
          flash[:notice] = "Started a race with delayed job in JS."
          render :js => "window.location.replace('/job/new/delayed_job');"
        end
      }
      format.html {
        case params[:id]
        when 'faye'
        when 'polling'
          flash[:notice] = "Started a race with dumb procedural blocking."
          @pole_race.start
        when 'delayed_job'
          #flash[:notice] = "Started a race with delayed job."
          @pole_race.delay.start
        when 'beanstalkd'
        else
          raise "Don't hack the Gibson.  Pass a real job type."
        end
      }
    end
    #respond_with(@job_id = params[:id])
  end
  
end
