JazzyTodo::Application.routes.draw do
  resources :todos
  root :to => 'application#index'
end
