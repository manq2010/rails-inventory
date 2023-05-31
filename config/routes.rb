Rails.application.routes.draw do
  require "sidekiq/web"
  require "sidekiq/cron/web"

  mount ActionCable.server => "/cable"
  # mount Easymon::Engine => "/up"

  authenticate :user, ->(u) { u.admin? || Rails.env.development? } do
    # mount LetterOpenerWeb::Engine, at: "/letter_opener" if Rails.env.development?
    mount Flipper::UI.app(Flipper), at: "/flipper"
    mount Sidekiq::Web, at: "/sidekiq"
    # mount PgHero::Engine, at: "/pghero"
  end

  devise_for :users,
    controllers: {registrations: "authentication/registrations", sessions: "authentication/sessions"},
    class_name: "Accounts::User"

  devise_scope :user do
    unauthenticated :user do
      root "authentication/sessions#new"
    end

    authenticated :user, ->(u) { u.admin? } do
      root "admin/settings#index", as: :authenticated_admin_root
    end

    authenticated :user do
      root "apps#index", as: :authenticated_root
    end
  end

  namespace :authentication do
    resources :invite_confirmations, only: %i[new create]
  end

  namespace :accounts do
    resources :organizations, only: [:index] do
      member do
        get :switch
      end

      resource :team, only: [:show]
      resources :invitations, only: %i[new create]
    end
  end

  namespace :admin do
    resource :settings, only: [:index]
  end

  match "/", via: %i[post put patch delete], to: "application#raise_not_found", format: false
  match "*unmatched_route", via: :all, to: "application#raise_not_found", format: false,
    constraints: lambda { |req| req.path.exclude? "rails/active_storage" }

end
