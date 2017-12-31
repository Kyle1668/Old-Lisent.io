class Api::AnalysesController < ApplicationController

  skip_before_action :verify_authenticity_token

  def index
    # render json: Analysis.all
    handle_api_responce
  end

  def handle_api_responce
      analysis = Analysis.new

      if params[:input] != nil
          analysis.argued_text = params[:input].gsub('"', '')
          sanitized_input = params[:input].downcase.gsub(/[^a-z0-9\s]/i, '')

          output = `python Python-Sentiment-Analysis-Program/get_sentiment.py "#{sanitized_input}"`
          sentiment_analysis = JSON.parse(output)

          analysis.classification = sentiment_analysis["classification"]
          analysis.ppos = sentiment_analysis["P_Pos"]
          analysis.pneg = sentiment_analysis["P_Neg"]

          print(output)
      end

      render json: analysis
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
