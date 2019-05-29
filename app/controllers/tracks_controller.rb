class TracksController < ApplicationController
  def new
    @track = Track.new
  end

  def create
    @track = Track.new(track_params)
    @track.user = current_user
    if @track.save
      redirect_to requests_path
    else
      render :new
    end
  end

  private

  def track_params
    params.require(:track).permit(:name, :bpm, :time_signature, :key, :duration)
  end
end
