class Api::V1::CalculationsController < ApplicationController
  def create
    result = StringCalculator.add(params[:input].to_s)
    render json: { result: result }
  rescue => e
    render json: { error: e.message }, status: :unprocessable_entity
  end
end
