Rails.application.routes.draw do

  root :to => "application#index"

  resources :account, only: :index do
    collection do
      get 'get_balance'
      get 'get_username'
    end
  end

  resources :transaction, only: [:index, :create] do
    collection do
    end
  end

  get '*path' => 'application#index'

end
