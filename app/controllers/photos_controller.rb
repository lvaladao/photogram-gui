class PhotosController < ApplicationController
  def index
    @photos = Photo.all.order({ :created_at => :desc })

    render({ :template => "photo_templates/index.html.erb" })
  end

  def details
    @photo = Photo.where({ :id => params.fetch("photo_id") }).at(0)

    render({ :template => "photo_templates/show.html.erb" })
  end

  def delete
    @photo = Photo.where({ :id => params.fetch("photo_id") }).at(0)
    @photo.destroy

    redirect_to("/photos")
  end

  def create
    @new_photo = Photo.new
    @new_photo.image = params.fetch("input_caption")
    @new_photo.owner_id = params.fetch("input_owner_id")
    @new_photo.save

    redirect_to("/photos/" + @new_photo.id.to_s)
  end

  def update
    @photo = Photo.where({ :id => params.fetch("photo_id") }).at(0)
    @photo.image = params.fetch("input_image")
    @photo.caption = params.fetch("input_caption")
    @photo.save

    redirect_to("/photos/" + @photo.id.to_s)
  end
end
