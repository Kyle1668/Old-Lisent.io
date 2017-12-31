class Api::AnalysesController < ApplicationController

  skip_before_action :verify_authenticity_token

  def index
    # render json: Analysis.all
    handle_api_responce
  end

  def handle_api_responce
      analysis = Analysis.new

      if params[:input] != nil
          analysis = Analysis.new
          analysis.argued_text = params[:input]
          analysis.save
      end

      render json: analysis
  end

  def rupy_test
      require "rupy"

      Rupy.start # start the Python VM

      cPickle = Rupy.import("cPickle")
      p cPickle.dumps("Testing rupy").rubify

      Rupy.stop # stop the Python VM
  end

  # def show
  #   list = Analysis.find(params[:id])
  #   render json: list
  # end

  # def create
  #   analysis = Analysis.new
  #   analysis.argued_text = params[:input]
  #
  #   if analysis.save
  #       print("Input Param: " + params[:input])
  #     head 200
  #   else
  #       print("Not Saved")
  #     head 500
  #   end
  #
  # end

  private

  def list_params
    params.require('analyses').permit('input')
  end

end
