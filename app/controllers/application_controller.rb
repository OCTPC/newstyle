class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead
  protect_from_forgery with: :exception
  #def index
  #@least = Content.order(:created_at).limit(10)  #end
  #end
  
end
