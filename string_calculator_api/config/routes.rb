Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      post 'calculate', to: 'calculations#create'
    end
  end
end
