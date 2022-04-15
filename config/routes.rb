Rails.application.routes.draw do
  get "/books",to "books#index"

  roots "books#index"
end
