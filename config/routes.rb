Rails.application.routes.draw do
  get("/", { :controller => "users", :action => "index" })
  get("/users", { :controller => "users", :action => "index" })
  get("/users/:user_id", { :controller => "users", :action => "details" })

  get("/photos", { :controller => "photos", :action => "index" })
  get("/photos/:photo_id", { :controller => "photos", :action => "details" })
end
