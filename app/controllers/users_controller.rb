class UsersController < ApplicationController
  def index
    @users = User.all.order({ :created_at => :desc })

    render({ :template => "user_templates/index.html.erb" })
  end

  def details
    @user = User.where({ :username => params.fetch("username") }).at(0)

    render({ :template => "user_templates/show.html.erb" })
  end
end
