Rails.application.routes.draw do
  resources :policies
  resources :companies
  resources :employees

  resources :employees do
    collection {post :import}
  end

  get "/bulk_import" => "employees#bulk_import", :as => "bulk_import"

  get 'employees/import' => 'employees#employee_import'
end
