class ObjectTypesController < ApplicationController
    skip_before_action :authorized, only: [:index, :show, :create]
    def index 
        @object_types = ObjectType.name_sort
    end

    def show
        @object_type = ObjectType.find(params[:id])
        @forsale = false 
        # byebug
        if params[:forsale]
            @forsale = true 
            @forsale_artwork = @object_type.artworks.for_sale?
        end
    end

    def create 
        @object_type = ObjectType.create(object_type_params)
        if @object_type.valid?
            redirect_to @object_type
        else
            flash[:errors] = @object_type.errors.full_messages
            redirect_to new_object_type_path
        end
    end

    private 

    def object_type_params
        params.require(:object_type).permit(:name, :description)
    end
end
