class PhotosController < ApplicationController
  def index
    @photos = Photo.all.order({ :created_at => :desc })

    render({ :template => "photo_templates/index.html.erb" })
  end

  def details
    @photo = Photo.where({ :id => params.fetch("photo_id") }).at(0)

    render({ :template => "photo_templates/show.html.erb" })
  end
end
