class CommentsController < ApplicationController
before_action :find_comment, only: [:show, :edit, :update, :destroy]
before_action :find_story
before_action :authenticate_user!

  def index
    @comments = Comment.all
  end

  def show
    #code
  end

  def edit
    #code
  end
  def update
    @comment.update(comment_params)
  end

  def new
    @comment = Comment.new
  end

  def create
    @comment = Comment.new(comment_params)
    @comment.user = current_user
    @comment.story_id = @story.id

    if @comment.save
      redirect_to @story
    else
      render 'new'
    end
  end

  def destroy
    @comment.destroy
  end

  private

  def find_comment
    @comment = Comment.find(params[:id])
  end
  def find_story
    @story = Story.find(params[:story_id])
  end
  def comment_params
    params.require(:comment).permit(:body)
  end
end
