# == Route Map
#

Rails.application.routes.draw do
  namespace 'api' do
    namespace 'v1' do
      resources :users
      post '/auth/login', to: 'session#new_session'
      post '/auth/sign_up', to: 'session#create_session'
    end
  end
end
