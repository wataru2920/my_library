class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :withdraw]
  before_action :login_user_seigen, only: [:login_form, :login, :new, :create]
  before_action :login_seigen, {only: [:show, :edit, :update, :logout, :withdraw]}
  before_action :only_owner, only: [:list]

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      flash[:notice] = "新規登録に成功しました"
      redirect_to '/books/list'
    else
      render '/users/new'
    end
  end

  def show
    @reserves = Reserve.where(user_id: @user.id, flag: nil)
    @circulations = Reserve.where(user_id: @user.id, flag: 1)
  end

  def edit
  end

  def update
    if @user.update(user_params)
      flash[:notice] = "更新に成功しました"
      redirect_to("/users/#{@user.id}")
    else
      render("/users/edit")
    end
  end

  def login_form
  end

  def login
    @user = User.find_by(email: params[:email])
    if @user && @user.authenticate(params[:password]) then
      session[:user_id] = @user.id
      flash[:notice] = "ログインしました"
      redirect_to("/books/list")
    else
      @error = "メールアドレスまたはパスワードが間違っています"
      @email = params[:email]
      @password = params[:password]
      render("users/login_form")
    end
  end

  def logout
    session[:user_id] = nil
    flash[:notice] = "ログアウトしました"
    redirect_to("/login")
  end

  def withdraw
    session[:user_id] = nil
    @user.destroy
    flash[:notice] = "退会が完了しました"
    redirect_to("/login")
  end

  def list
    @users = User.all
  end

  private
  def user_params
    params.permit(:username,:email,:email_confirmation,:password,:password_confirmation,:post_code,:address,:phone_number,:sex,:birthday)
  end

  def set_user
    @user = User.find(params[:id])
    if @current_user.id != @user.id
      flash[:notice] = "権限がありません"
      redirect_to("/books/list")
    end
  end

  def only_owner
    if @current_user.id != 1
      flash[:notice] = "権限がありません"
      redirect_to("/books/list")
    end
  end
end
