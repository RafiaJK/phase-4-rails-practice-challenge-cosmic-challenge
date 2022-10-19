class MissionsController < ApplicationController
    def create
        mission = Mission.create(name: params[:name], scientist_id: params[:scientist_id], planet_id: params[:planet_id])
        if mission.valid?
            render json: mission.id.planet, status: :created
        else
            render json: {errors: missions.errors}, status: :unprocessable_entity
        end
    end
end
