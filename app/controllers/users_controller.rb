class UsersController < ApplicationController
  before_action :find_user, only: [:show, :edit, :update]
  skip_before_action :authorized, only: [:new, :create, :index]

  
  def index
    # byebug
    @users = User.best_first
  end
  
  def show
      @forsale = false 
      if params[:forsale]
        if @user.my_sale_artworks == true || @user.my_sale_artworks != []
        @forsale = true
        @forsale_artwork = @user.artworks.for_sale? 
      end
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
    params.require(:user).permit(:name, :location, :img_url, :bio, :email, :password)
  end

  def find_user
    @user = User.find(params[:id])
  end
  
end
