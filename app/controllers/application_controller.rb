class ApplicationController < ActionController::Base
  protect_from_forgery
  require "tab_menu"
  # GET /users
  # GET /users.xml
  def index3
    @users = User.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @users }
    end
  end
end
