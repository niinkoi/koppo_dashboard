module Api
  module V1
    class SessionController < ApplicationController
      include DashboardApiHelper, KoppoDashboard
      skip_before_action :authenticate_request

      REQUIRED_PARAMS = %i(first_name last_name username email password).freeze

      def new_session
        begin
          result = required_params(params, :email, :password)
          @user = User.find_by_email(result[:email])

          if @user&.authenticate(result[:password])
            expire_at = Time.now.to_i + 120
            token = jwt_encode({ user_id: @user.id }, expire_at)
            render json: { token: token, expiration: expire_at }, status: :ok
          else
            render_error(401, I18n.t("session.error_messages.unauthorized"))
          end
        rescue ArgumentError => e
          render_error(400, e.message)
        end
      end

      def create_session
        begin
          @user = User.new(user_params)
          if @user.save
            head :created
          else
            raise ArgumentError, I18n.t("session.error_messages.existed_account")
          end
        rescue ArgumentError => e
          render_error(400, e.message)
        end
      end

      private

      def user_params
        values = required_params(params, *REQUIRED_PARAMS)
        params.permit(*values)
      end
    end
  end
end
