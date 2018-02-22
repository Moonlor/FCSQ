class ViaCityNamesController < ApplicationController
  before_action :signed_in_user
  def new
  	@city_amount = params[:amount]
  	pp @city_amount
  	respond_to do |format|
  	  format.js
  	end
  end
end
