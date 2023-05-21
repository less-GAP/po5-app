Rails.application.routes.draw do
  # Spree routes
  mount Spree::Core::Engine, at: '/'

  # sidekiq web UI
  require 'sidekiq/web'
  Sidekiq::Web.use Rack::Auth::Basic do |username, password|
    username == Rails.application.secrets.sidekiq_username &&
      password == Rails.application.secrets.sidekiq_password
  end
  mount Sidekiq::Web, at: '/sidekiq'

  Spree::Core::Engine.add_routes do
    namespace :admin do
      resources :videos, only: [:index, :new, :create]
      get 'videos/new', to: 'videos#new', as: 'new_spree_video'
    end
  end
end
