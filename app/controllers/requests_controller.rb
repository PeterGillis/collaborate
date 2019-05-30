class RequestsController < ApplicationController
  def index
    @requests = Request.all
  end

  def show
    @request = Request.find(params[:id])
    @submission = Submission.new
    # @submission.submission_card = Submission.find(params[:request_id])
    # @submission.instrument = Instrument.find(params[:submission][:instrument_id])
  end

  def new
    @track = Track.find(params[:track_id])
    @request = Request.new
  end

  def create
    @request = Request.new(request_params)
    @request.track = Track.find(params[:track_id])
    @request.instrument = Instrument.find(params[:request][:instrument_id])
    if @request.save
      redirect_to requests_path
    else
      render :new
    end
  end

  private

  def request_params
    params.require(:request).permit(:start_second, :end_second, :description, :instrument_id)
  end

  def submission_params
    params.require(:submission).permit()
  end
end
