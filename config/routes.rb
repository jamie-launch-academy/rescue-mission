Rails.application.routes.draw do
  get 'welcome/index'

    resources :questions

    root 'welcome#index'
end
