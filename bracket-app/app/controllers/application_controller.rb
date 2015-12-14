class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  layout "todo_list"
  
  before_action :get_all_tournaments
  
  def get_all_tournaments
    @all_tournaments = Tournament.all
  end
end
