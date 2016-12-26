Rails.application.routes.draw do
  # get 'landlords/index'
  # get 'landlords/show'
  # get 'landlords/edit'
  # get 'landlords/new'

  resources :landlords
  
  get 'estates/index'
  get 'estates/new'
  get 'estates/show'
  get 'estates/edit'


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
