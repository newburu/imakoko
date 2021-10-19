module Api
  module V1
    class UsersController < ApplicationController
      before_action :set_user, only: %i[ last_location ]
    
      # GET /user/last_location?code=XXX
      def last_location
        if @user.present?
          render json: { status: 'SUCCESS', user: @user, location: @user.try(:last_location) }
        else
          render json: { status: 'ERROR', message: 'Not user.' }
        end
      end

      private
        def set_user
          @user = User.find_by_code(params[:code])
        end

    end
  end
end