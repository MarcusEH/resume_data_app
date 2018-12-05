Rails.application.routes.draw do
  # STEP 1: A ROUTE triggers a controller action
  # verb "/urls" => "namespace/controllers#action"
  namespace :api do
    resources :students, :skills, :experiences, :educations, :capstones
    post "/users" => "users#create"
    post "/sessions" => "sessions#create"
  end
end
