class MembershipsController < ApplicationController

    def create
        membership = Membership.create!(membership_params)
        render json: membership, status: :created, except: [:created_at, :updated_at]
    rescue ActiveRecord::RecordInvalid => invalid
        render json: { error: invalid.record.errors.full_messages }, status: :unprocessable_entity
    end

    private

    def membership_params
        params.permit(:gym_id, :client_id, :charge)
    end

end
