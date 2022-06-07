require 'rails_helper'

describe Api::V1::SessionController do
  describe '#new_session' do
    let(:request_params) do
      {
        email: 'admin123@admin.com',
        password: 'admin@123'
      }
    end

    context 'when params is missing' do
      it 'return 400 when email is missing' do
        post :new_session, params: request_params.except(:email)
        expect(response.status).eql?(400)
        expect(JSON.parse(response.body))
          .to eq({ 'errors' => ["Missing required parameter 'email'"] })
      end

      it 'return 400 when password is missing' do
        post :new_session, params: request_params.except(:password)
        expect(response.status).eql? 400
        expect(JSON.parse(response.body))
          .to eq({ 'errors' => ["Missing required parameter 'password'"] })
      end
    end

    context 'when user is not found by request email' do
      it 'return 400 when email not found' do
        expect(User)
          .to receive(:find_by_email)
          .with('admin123@admin.com')
          .and_return(nil)

        post :new_session, params: request_params
        expect(response.status).eql? 401
      end
    end
  end
end
