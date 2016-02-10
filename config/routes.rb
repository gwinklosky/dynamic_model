Rails.application.routes.draw do
  resources :customers do
    resources :problems do
      resources :solutions
    end
  end

  root 'customers#index'
end
