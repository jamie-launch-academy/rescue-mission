Rails.application.routes.draw do

    resources :questions do
      resources :responses
    end

    root 'welcome#index'
end
