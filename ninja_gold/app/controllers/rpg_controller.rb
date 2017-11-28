class RpgController < ApplicationController
  def index
    unless session[:total]
      session[:total] = 0
    end
    unless session[:activity]
      session[:activity] = []
    end
  end

  def farm
    gold = rand(10...21)
    session[:total] += gold
    session['activity'].push({text:"Earned #{gold} golds from the farm! (#{Time.now.in_time_zone('Pacific Time (US & Canada)').strftime('%Y/%m/%d %I:%M %p')})", result:"earn"})
    redirect_to '/'
  end

  def cave
    gold = rand(5...11)
    session[:total] += gold
    session['activity'].push({text:"Earned #{gold} golds from the cave! (#{Time.now.in_time_zone('Pacific Time (US & Canada)').strftime('%Y/%m/%d %I:%M %p')})", result:"earn"})
    redirect_to '/'
  end

  def house
    gold = rand(2...6)
    session[:total] += gold
    session['activity'].push({text:"Earned #{gold} golds from the house! (#{Time.now.in_time_zone('Pacific Time (US & Canada)').strftime('%Y/%m/%d %I:%M %p')})", result:"earn"})
    redirect_to '/'
  end

  def casino
    gold = rand(-50...51)
    session[:total] += gold
    if gold >= 0
      session['activity'].push({text:"Earned #{gold} golds from the casino! (#{Time.now.in_time_zone('Pacific Time (US & Canada)').strftime('%Y/%m/%d %I:%M %p')})", result:"earn"})
    else
      session['activity'].push({text:"Entered a casino and lost #{-gold} golds... Ouch! (#{Time.now.in_time_zone('Pacific Time (US & Canada)').strftime('%Y/%m/%d %I:%M %p')})", result:"lost"})
    end 
    redirect_to '/'
  end

  def clear
    session[:total] = 0
    session[:activity] = []
    redirect_to '/'
  end

end
