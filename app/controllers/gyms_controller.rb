class GymsController < ApplicationController

    def show
        gym = gym_params
        render json: gym, status: :ok, except: [:created_at, :updated_at]
    rescue ActiveRecord::RecordNotFound
        render json: { error: "Gym not found!" }, status: :not_found
    end

    def destroy
        gym = gym_params
        gym.destroy
        head :no_content
    rescue ActiveRecord::RecordNotFound
        render json: { error: "Gym not found!" }, status: :not_found
    end

    private

    def gym_params
        Gym.find(params[:id])
    end

end
