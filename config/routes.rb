Rails.application.routes.draw do
  get "/books",to: "books#index"
  get "/books/new", to: "books#create"
  root "books#index"
  
end
