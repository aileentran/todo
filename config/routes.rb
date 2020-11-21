Rails.application.routes.draw do
  resources :todo_lists do
    resources :todo_items
  end

  put '/todo_lists/:todo_list_id/todo_items/:id/complete', to: 'todo_items#complete', as: 'complete_todo_list_todo_item'

  root "todo_lists#index"
end
