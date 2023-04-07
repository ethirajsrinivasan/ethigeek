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
  get "/portfolio", to: "home#portfolio"
  get "/contact", to: "home#contact"
  get "/about", action: :about, controller: 'home'
  get "/gadgets", action: :gadgets_and_accessories, controller: 'home'
  get "/resume", to: redirect('/resume.pdf')
  get "/portfolios/:title", to: "home#show", as: 'portfolios'
  post "/portfolios/:title/like", to: "home#like", as: 'portfolios_like'
  get "/portfolios_filter", to: "home#filter", as: 'portfolios_filter'
  resources :projects
end
