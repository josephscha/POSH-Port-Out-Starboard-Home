class ArtworksController < ApplicationController
  before_action :find_artwork, only: [:show, :edit, :update, :buy_it]
  skip_before_action :authorized, only: [:index, :show]
  
  def index 
    @artworks = Artwork.all
    @forsale = false 

    if params[:forsale]
      @forsale = true 
      @forsale_artwork = Artwork.for_sale? 
      render :index
    end
  end

  def show
  end
  
  def new
    @artwork = Artwork.new
  end
  
  def create
    @artist = Artist.find_or_create_by(name: params[:artwork][:artist])
    new_params = artwork_params
    new_params[:artist_id] = @artist.id
    @artwork = Artwork.create(new_params)
    if @artwork.valid?
      redirect_to @artwork
    else
      flash[:errors] = @artwork.errors.full_messages
      redirect_to new_artwork_path # go back to add artwork form
    end
  end

  def edit
  end

  def update
    if @artwork.update(artwork_params)
      redirect_to @artwork
    else
      flash[:errors] = @artwork.errors.full_messages
      redirect_to edit_artwork_path
    end
  end
# This destroy action is going to be called in user's show page. 
# use cookies to determine if user owns artwork 
  def destroy
    @artwork = Artwork.find_by(id: params[:id])
    @artwork.destroy
    redirect_to @current_user
  end

  def buyit
    #Whatever artwork .buy_artwork method (the user)
    # @artwork = Artwork.find_by(params[:artwork])
    @artwork = Artwork.find(params[:artwork_id])
    if @current_user.balance > @artwork.price 
      funds = @current_user.balance
      new_balance = funds - @artwork.price
      @current_user.balance = new_balance
      @current_user.save
      seller_balance = @artwork.user.balance 
      seller_new_balance = seller_balance + @artwork.price
      @artwork.user.balance = seller_new_balance
      @artwork.user.save
      @artwork.buy_artwork(@current_user.id)
      redirect_to @current_user
    else  
      flash[:error] = "You do not have enough $$$"
      redirect_to @artwork
    end
    
  end


  private
  
  def artwork_params
    params.require(:artwork).permit(:title, :img_url, :image, :price, :for_sale, :object_type_id, :user_id)
  end


  def find_artwork
    @artwork = Artwork.find(params[:id])
  end
end
