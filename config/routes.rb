Rails.application.routes.draw do
  devise_for :users
  resources :blogs do
    member do
      post :like
    end
    collection do
      get :show_all
    end
  end
  resources :sections
  # resources :projects
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root "home#welcome"
  get "/about", action: :about, controller: 'home'
  get "/gadgets", action: :gadgets_and_accessories, controller: 'home'
  get "/portfolios/:title", to: "home#show", as: 'portfolios'
  get "/portfolios_filter", to: "home#filter", as: 'portfolios_filter'
  resources :projects
end
