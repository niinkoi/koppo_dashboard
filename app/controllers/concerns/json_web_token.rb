require 'jwt'

module JsonWebToken
  extend ActiveSupport::Concern

  SECRET_KEY = Rails.application.secret_key_base

  def jwt_encode(payload, expiration)
    payload[:exp] = expiration
    JWT.encode(payload, SECRET_KEY)
  end

  def jwt_decode(token)
    raise ArgumentError unless token

    decoded = JWT.decode(token, SECRET_KEY)[0]
    HashWithIndifferentAccess.new decoded
  rescue ArgumentError
    { errors: I18n.t('session.error_messages.unauthorized') }
  end
end
