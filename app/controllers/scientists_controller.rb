class ScientistsController < ApplicationController

    def index
        scientists = Scientist.all
        render json: scientists, status: :ok
    end

    def show
        one_scientist = Scientist.find_by(id: params[:id])
        if one_scientist
            render json: one_scientist, status: :ok,
            serializer: SingleScientistSerializer#,
          # include: ['missions']
        else
            render json: {error: "Scientist not found"}, status: :not_found
        end
    end

    def create
        scientist = Scientist.create(name: params[:name], field_of_study: params[:field_of_study], avatar: params[:avatar])
        if scientist.valid?
            render json: scientist, status: :created
        else
            render json: {errors: scientist.errors.full_messages}, status: :unprocessable_entity
        end
    end

    def update
        scientist = Scientist.find_by(id: params[:id])
        if scientist
            scientist.update(name: params[:name], field_of_study: params[:field_of_study], avatar: params[:avatar])
            if scientist.valid?
                render json: scientist, status: :accepted
            else
                render json: {errors: scientist.errors.full_messages}, status: :unprocessable_entity
            end
        else
            render json: {error: "Scientist not found"}, status: :not_found
        end
    end

    def destroy
        scientist = Scientist.find_by(id: params[:id])
       
        if scientist
            scientist.destroy
            render json: {}, status: :no_content
        else
            render json: {error: "Scientist not found"}, status: :not_found
        end
    end



end
