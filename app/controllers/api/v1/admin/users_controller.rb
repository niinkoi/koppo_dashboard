module Api
  module V1
    module Admin
      class UsersController < ApplicationController
        include DashboardApiHelper

        skip_before_action :authenticate_request
        before_action :set_user, only: %i[show update destroy]

        REQUIRED_PARAMS = %i[first_name last_name username email password].freeze

        # GET /users
        def index
          @users = select_without_columns(%w[password_digest])
          render json: @users
        end

        # GET /users/1
        def show
          render json: @user
        end

        # PATCH/PUT /users/1
        def update
          if @user.update(user_params)
            render json: @user
          else
            render json: @user.errors, status: :unprocessable_entity
          end
        end

        # DELETE /users/1
        def destroy
          @user.destroy
        end

        private

        # Use callbacks to share common setup or constraints between actions.
        def set_user
          @user = User.find(params[:id])
        end

        def user_params
          values = required_params(params, *REQUIRED_PARAMS)
          params.permit(*values)
        end

        def select_without_columns(columns)
          User.select(User.column_names - columns)
        end
      end
    end
  end
end
