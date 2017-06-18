Rails.application.routes.draw do
  resources :meals
  resources :foods
  post 'meals/add/:food_id', to: 'meals#add_food', as: 'add_food'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
