Rails.application.routes.draw do

  post 'signup' => 'users#create', as: :users  # signup
  post 'signin' => 'sessions#create', as: :auth # signin

end
