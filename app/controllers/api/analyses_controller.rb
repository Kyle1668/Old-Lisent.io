class Api::AnalysesController < ApplicationController

  skip_before_action :verify_authenticity_token

  def index
    # render json: Analysis.all
    handle_api_responce
  end

  def handle_api_responce
    if params[:input] != nil && params[:input].length > 0
      analysis = Analysis.new
      analysis.argued_text = params[:input].gsub('"', '')
      sanitized_input = params[:input].downcase.gsub(/[^a-z0-9\s]/i, '')


      output = `python NLP/get_sentiment.py "#{sanitized_input}"`
      sentiment_analysis = JSON.parse(output)

      analysis.classification = sentiment_analysis['classification']
      analysis.ppos = sentiment_analysis['P_Pos']
      analysis.pneg = sentiment_analysis['P_Neg']

      render json: analysis
    else
      render json: {
          :error => 'Empty input argument'
      }
    end
  end

  def get_sentiment_data(entered_text)
    output = `python NLP/get_sentiment.py "#{sanitized_input}"`
    sentiment_analysis = JSON.parse(output)

    analysis.classification = sentiment_analysis['classification']
    analysis.ppos = sentiment_analysis['P_Pos']
    analysis.pneg = sentiment_analysis['P_Neg']
    print(output)

    output
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
