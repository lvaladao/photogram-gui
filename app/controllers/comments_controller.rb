class CommentsController < ApplicationController
  def create
    @new_comment = Comment.new
    @new_comment.photo_id = params.fetch("input_photo_id")
    @new_comment.author_id = params.fetch("input_author_id")
    @new_comment.body = params.fetch("input_body")
    @new_comment.save

    redirect_to("/photos/" + params.fetch("input_photo_id"))
  end
end
