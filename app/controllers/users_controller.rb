class UsersController < ApplicationController
  # GET /users
  # GET /users.json

  before_filter :authorize_user, only: [:edit, :update, :destroy]

  def authorize_user
    @user = User.find(params[:id])
    if @user != current_user
     redirect_to users_url, notice: "Nice try!"
    end
  end


  def index

      page_number = params[:page].to_i
      @users = User.page(page_number).per(4)

    if params[:search]
    @user_exists_from_search = User.where("name LIKE ? OR email LIKE ?", "%#{params[:search]}%", "%#{params[:search]}%").first
    if @user_exists_from_search
      @users_returned_from_search = User.where("name LIKE ? OR email LIKE ?", "#{@user_exists_from_search.name}", "#{@user_exists_from_search.email}")
    else
      @users
    end
  else
    @users
  end


    respond_to do |format|
      format.html do
        render 'index'
      end
      format.json do
        render json: @users
      end
    end
  end

  # GET /users/1
  # GET /users/1.json
  def show
    @user = User.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @user }
    end
  end

  # GET /users/new
  # GET /users/new.json
  def new
    @user = User.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @user }
    end
  end

  # GET /users/1/edit
  def edit
    @user = User.find(params[:id])
  end

  # POST /users
  # POST /users.json
  def create
    @user = User.new(params[:user])

    respond_to do |format|
      if @user.save
        email = UserMailer.welcome(@user)
        email.deliver
        format.html { redirect_to @user, notice: 'User was successfully created.' }
        format.json { render json: @user, status: :created, location: @user }
      else
        format.html { render action: "new" }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /users/1
  # PUT /users/1.json
  def update
    @user = User.find(params[:id])

    respond_to do |format|
      if @user.update_attributes(params[:user])
        format.html { redirect_to @user, notice: 'User was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    @user = User.find(params[:id])
    @user.destroy

    respond_to do |format|
      format.html { redirect_to users_url }
      format.json { head :no_content }
    end
  end
end
