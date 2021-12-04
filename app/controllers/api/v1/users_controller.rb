module Api
  module V1
    class UsersController < ApplicationController
      before_action :set_user, only: %i[ regist_location last_location ]

      # GET /user/regist_location?code=XXX&latitude=XXX&longitude=XXX
      def regist_location
        if @user.present?
          @location = Location.new(user: @user, latitude: params[:latitude], longitude: params[:longitude])
          if @location.save
            render json: { status: 'SUCCESS', user: @user, location: @location }
          else
            render json: { status: 'ERROR', message: @location.errors.full_messages }
          end
        else
          render json: { status: 'ERROR', message: 'Not user.' }
        end
      end
      
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