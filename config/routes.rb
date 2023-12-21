Rails.application.routes.draw do
  root "top#index"
  post "income_values/new(/:name)" => "income_values#new"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :incomes
  resources :fixedcosts
  resources :variablecosts
  resources :income_values
end
