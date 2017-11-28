class SurveysController < ApplicationController
  def index
    unless session[:count]
      session[:count] = 0
    end
  end 

  def process_form      
      session[:count] += 1

      session[:result] = params[:survey]

      flash[:success] = "Thanks for submitting this form! You have submitted this form #{ session[:count] } time(s) now."
      
      redirect_to '/result'
  end

  def result
      @result = session[:result]
  end
end
