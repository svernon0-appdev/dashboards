Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  get("/", {:controller => "currencies", :action => "homepage" })

  get("/forex", { :controller => "currencies", :action => "first_currency" })

  get("/forex/:first_symbol/:second_symbol"), { :controller => "currencies", :action => "second_currency" }

end
