require 'rails_helper'

describe Api::V1::Admin::UsersController do
  describe 'get /users' do
    context 'when request is unauthorized' do
      expect(authentication)
    end
  end
end
