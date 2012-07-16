class DelayedJobController < ApplicationController
  respond_to :html, :xml, :json
  
  def show
    begin
      @job = Delayed::Job.find params[:id]
    rescue ActiveRecord::RecordNotFound
      @job = nil
    end
    respond_with @job do |format|
      format.json {
        if @job
          render :json => @job.to_json
        else
          render :json => {:error => "job not found"}.to_json
        end
      }
    end
  end
  
end