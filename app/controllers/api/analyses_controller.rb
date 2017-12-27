class Api::AnalysesController < ApplicationController
  def index
    render json: Analysis.all
  end

  def show
    list = Analysis.find(params[:id])
    render json: list
  end
end