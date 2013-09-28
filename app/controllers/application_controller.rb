class ApplicationController < ActionController::Base
  protect_from_forgery
  
  def home
    # do nothin
    puts 'home!'
  end
  
end
