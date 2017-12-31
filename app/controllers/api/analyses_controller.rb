class Api::AnalysesController < ApplicationController

  skip_before_action :verify_authenticity_token

  def index
    # render json: Analysis.all

    analysis = Analysis.new

    if params[:input] != nil
        analysis = Analysis.new
        analysis.argued_text = params[:input]
    end

    render json: analysis

  end

  def show
    list = Analysis.find(params[:id])
    render json: list
  end

  def create
    analysis = Analysis.new
    analysis.argued_text = params[:input]

    if analysis.save
        print("Input Param: " + params[:input])
      head 200
    else
        print("Not Saved")
      head 500
    end

  end

  private

  def list_params
    params.require('analyses').permit('input')
  end

end
