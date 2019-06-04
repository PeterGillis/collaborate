class RequestsController < ApplicationController
  def index
    @requests = Request.all
    if params[:query].present?
      @requests = Request.search_by_instrument_and_genre(params[:query])
    else
      @requests = Request.all
    end
  end

  def show
    @request = Request.find(params[:id])
  end

  def my_requests
    @requests = current_user.requests
  end

  def new
    @track = Track.find(params[:track_id])
    @request = Request.new
  end

  def create
    @request = Request.new(request_params)
    @track = Track.find(params[:track_id])
    @request.track = Track.find(params[:track_id])
    @request.instrument = Instrument.find(params[:request][:instrument_id])
    if @request.save
      redirect_to requests_path
    else
      render :new
    end
  end

  def destroy
    @request = Request.find(params[:id])
    @request.destroy
    redirect_to my_requests_path
  end

  private

  def request_params
    params.require(:request).permit(:start_second, :end_second, :description, :instrument_id)
  end

  def submission_params
    params.require(:submission).permit(:description, :name, :selected, :bpm, :time_signature, :key, :file)
  end
end
