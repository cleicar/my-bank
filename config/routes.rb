Rails.application.routes.draw do

  root :to => "application#index"

  resources :account do
    collection do
      get  'get_balance'
    end
  end

  get '*path' => 'application#index'

end
