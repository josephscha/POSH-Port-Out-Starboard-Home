class CollectorsController < ApplicationController
  before_action :find_collector, only: [:show, :edit, :update]

  def welcome

  end
  
  def index
    @collectors = Collector.all
  end
  
  def show
  end
  def new
    @collector = Collector.new
  end
  
  def create
    @collector.create(collector_params)
    if @collector.valid?
      redirect_to @collector
    else
      flash[:errors] = @collector.errors.full_messages
      redirect_to new_collector_path
    end
  end
  

  def edit
  end
  
  def update
    if @collector.update
      redirect_to @collector
    else
      flash[:errors] = @collector.errors.full_messages
      redirect_to edit_collector_path
    end
  end


  private

  def collector_params
    params.require(:collector).permit(:name, :location, :img_url, :bio, :email)
  end

  def find_collector
    @collector = Collector.find(params[:id])
  end
  
end
