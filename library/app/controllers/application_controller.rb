class ApplicationController < ActionController::Base
  before_action :set_current_user
  def set_current_user
    @current_user = User.find_by(id: session[:user_id])
  end

  def login_seigen
    unless @current_user
      flash[:notice] = "ログインが必要です"
      redirect_to("/login")
    end
  end

  def login_user_seigen
    if @current_user
      flash[:notice] = "すでにログインしています"
      redirect_to("/books/list")
    end
  end
end
