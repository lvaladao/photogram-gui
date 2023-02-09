class UsersController < ApplicationController
  def index
    @users = User.all.order({ :created_at => :desc })

    render({ :template => "user_templates/index.html.erb" })
  end

  def details
    @user = User.where({ :username => params.fetch("username") }).at(0)

    render({ :template => "user_templates/show.html.erb" })
  end

  def create
    @new_user = User.new
    @new_user.username = params.fetch("input_username")
    @new_user.save

    redirect_to("/users/" + params.fetch("input_username"))
  end

  def update
    @user = User.where({ :id => params.fetch("user_id") }).at(0)
    @user.username = params.fetch("input_username")
    @user.save

    redirect_to("/users/" + params.fetch("input_username"))
  end
end
