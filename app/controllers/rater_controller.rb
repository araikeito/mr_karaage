# frozen_string_literal: true

class RaterController < ApplicationController
	before_action :authenticate_user!
  def create
    if user_signed_in?
      obj = params[:klass].classify.constantize.find(params[:id])
      obj.rate params[:score].to_f, current_user, params[:dimension]

      render json: true
    else
      render json: false
    end
  end
end
