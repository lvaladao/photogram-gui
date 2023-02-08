class UsersController < ApplicationController
  def index
    @users = User.all.order({ :created_at => :desc })

    render({ :template => "user_templates/index.html.erb" })
  end

  def details
    @user = User.where({ :id => params.fetch("user_id") }).at(0)

    render({ :template => "user_templates/show.html.erb" })
  end
end
