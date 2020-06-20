Rails.application.routes.draw do
  get "notes", to: "notes#index"
  get "notes/new", to: "notes#new", as: :new_note
  post "notes", to: "notes#create"
  get "notes/:id", to: "notes#show", as: :note
  get "notes/:id/edit", to: "notes#edit", as: :edit_note
  patch "notes/:id", to: "notes#update"
  delete "notes/:id", to: "notes#destroy"
end
