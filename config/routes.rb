Rails.application.routes.draw do
  get "coach/:id/slots" => "coaches#showslots"
  get "coach/:id/reviewed" => "coaches#showreviewed"
  get "slots/available" => "slots#available"
  get "student/:id/booked" => "students#showbooked"

  resources :slots
  resources :reviews
  resources :coaches
  resources :students
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"
end
