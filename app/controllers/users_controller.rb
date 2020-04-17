class UsersController < ApplicationController
  before_action :find_user, only: [:show, :edit, :update]
  skip_before_action :authorized, only: [:new, :create, :index, :show]

  
  def index
    # byebug
  end
  
  def show
      @forsale = false 
      if params[:forsale]
        @forsale = true
        @forsale_artwork = @user.artworks.for_sale? 
      end
  end

  def new
    @user = User.new
  end
  
  def create
    # byebug
    user = User.create(user_params)
    if user.valid?
      session[:user_id] = user.id
      redirect_to user
    else
      flash[:errors] = user.errors.full_messages
      redirect_to new_user_path
    end
  end
  

  def edit
  end
  
  def update
    if @user.update(user_params)
      redirect_to @user
    else
      flash[:errors] = @user.errors.full_messages
      redirect_to edit_user_path
    end
  end


  private

  def user_params
    params.require(:user).permit(:name, :location, :img_url, :bio, :email, :password, :balance)
  end

  def find_user
    @user = User.find(params[:id])
  end
  
end
