Rails.application.routes.draw do
  get 'incoming_email_controllers/create'
  resources :emails, except: [:edit, :update, :destroy]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
