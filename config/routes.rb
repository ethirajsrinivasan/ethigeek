Rails.application.routes.draw do
  resources :blogs do
    member do
      post :like
    end
  end
  resources :sections
  # resources :projects
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root "home#welcome"
  get "/portfolio", to: "home#portfolio"
  get "/contact", to: "home#contact"
  get "/about", to: "home#about"
  get "/resume", to: "home#resume"
  get "/portfolios/:title", to: "home#show", as: 'portfolios'
  post "/portfolios/:title/like", to: "home#like", as: 'portfolios_like'
  get "/portfolios_filter", to: "home#filter", as: 'portfolios_filter'
  resources :projects
end
