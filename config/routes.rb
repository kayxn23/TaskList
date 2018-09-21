Rails.application.routes.draw do
  root "tasks#index"

  get '/tasks', to: 'tasks#index', as: 'tasks' # as: allows us to name a path like tasks_path

  get '/tasks/new', to: 'tasks#new', as: 'new_task'
  post '/tasks', to: 'tasks#create'

  get '/tasks/:id/edit', to: 'tasks#edit', as: 'edit_task'

  get '/tasks/:id', to: 'tasks#show', as: 'task'

  patch '/tasks/:id', to: 'tasks#update'
  put '/tasks/:id', to: 'tasks#update'
  #find me this id and call #update from the tasks controller on it 

  delete '/tasks/:id', to: 'tasks#destroy'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

#any path that has :id will need a param , so you need to tell it what id to use
