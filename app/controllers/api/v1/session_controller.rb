module Api
  module V1
    class SessionController < ApplicationController
      include DashboardApiHelper
      skip_before_action :authenticate_request

      REQUIRED_PARAMS = %i[first_name last_name username email password].freeze

      def new_session
        result = required_params(params, :email, :password)
        @user = User.find_by_email(result[:email])

        if @user&.authenticate(result[:password])
          expire_at = Time.now.to_i + 120
          token = jwt_encode(generated_payload(@user), expire_at)
          render json: { token: token, expiration: expire_at }, status: :ok
        else
          render_error(401, I18n.t('session.error_messages.unauthorized'))
        end
      rescue ArgumentError => e
        render_error(400, e.message)
      end

      def create_session
        @user = User.new(user_params)

        raise ArgumentError, I18n.t('session.error_messages.existed_account') unless @user.save

        head :created
      rescue ArgumentError => e
        render_error(400, e.message)
      end

      private

      def user_params
        values = required_params(params, *REQUIRED_PARAMS)
        params.permit(*values)
      end

      def generated_payload(user, exp = Time.now.to_i)
        {
          email: user.email,
          username: user.username,
          name: [user.first_name, user.last_name].join(' '),
          exp: exp
        }
      end
    end
  end
end
