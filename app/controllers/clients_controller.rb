class ClientsController < ApplicationController

    def show
        client = client_params
        render json: client, status: :ok, except: [:created_at, :updated_at]
    rescue ActiveRecord::RecordNotFound
        render json: { error: "Client not found"}, status: :not_found
    end

    private

    def client_params
        Client.find(params[:id])
    end

end
