Rails.application.routes.draw do


  devise_for :users
    resources :questions do
      resources :responses
    end

    root 'welcome#index'
end
