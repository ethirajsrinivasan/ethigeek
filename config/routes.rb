Rails.application.routes.draw do
  resources :projects
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root "home#welcome"
  get "/portfolio", to: "home#portfolio"
  get "/contact", to: "home#contact"
  get "/about", to: "home#about"
  get "/portfolios/:id", to: "home#show", as: 'portfolios'
end
