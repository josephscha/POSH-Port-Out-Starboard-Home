class ObjectTypesController < ApplicationController
    def index 
        @object_types = ObjectType.all
    end

    def show
        @object_type = ObjectType.find(params[:id])
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
    end

    private 

    def object_type_params
        params.require(:object_type).permit(:name, :description)
    end
end
