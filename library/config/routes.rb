Rails.application.routes.draw do
  get 'users/new'
  post 'users/create'
  get "users/:id" => "users#show"
  get "users/:id/edit" => "users#edit"
  post "users/:id/update" => "users#update"
  get "login" => "users#login_form"
  post "login" => "users#login"
  get "logout" => "users#logout"
  post "users/:id/withdraw" => "users#withdraw"
  get "users/NID00054K/list" => "users#list"

  get 'books/list'
  post 'books/list2'
  get "books/:id" => "books#show"
  get "search" => "books#search_form"
  post "search" => "books#search"

  get "reserves/NID00054A/list" => "reserves#list"
  post "reserves/:book_id/create" => "reserves#create"
  post "reserves/:book_id/destroy" => "reserves#destroy"
  get "reserves/:user_id/lending/:book_id" => "reserves#lending"
  get "reserves/:user_id/cancel/:book_id" => "reserves#cancel"

  get 'top' => 'home#top'
end
