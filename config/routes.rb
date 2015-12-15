Rails.application.routes.draw do

  post '/register' => 'auth#register'
  # patch '/confirm' => 'auth#confirm'
  patch '/login' => 'auth#login'
  delete '/logout/:id' => 'auth#logout'

  resources :users, except: [:new, :edit]

  resources :books, except: [:new, :edit]

  resources :trips, except: [:new, :edit] do
    resources :destinations, except: [:new, :edit]
  end
end
