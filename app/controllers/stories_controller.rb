class StoriesController < ApplicationController
  before_action :find_story, only: [:edit, :update, :destroy, :show]
  before_action :authenticate_user!, only: [:new, :create]


  def index
    @stories = Story.all.order(created_at: :desc).page(params[:page]).per(5)
      if params[:keywords].present?
    @stories = Story.search params[:keywords], fields: [:title, :body]
      end
  end

  def new
    @story = Story.new
  end


  def create
    @story = Story.new(story_params)
    @story.user = current_user
    if @story.save
      redirect_to @story
    else
      flash[:danger] = @story.errors.full_messages.to_sentence
      render :new
    end
  end

  def show
    @random_story = Story.where.not(id: @story).order("RANDOM()").first
    @another_random_story = Story.where.not(id: @story, id: @random_story).order("RANDOM()").first
    @three_random_story = Story.where.not(id: @story, id: @random_story, id: @another_random_story).order("RANDOM()").first
  end


  def edit
  end

  def update

    if @story.update(story_params)
      redirect_to @story
    else
      render 'edit'
    end
  end

  def destroy
    @story.destroy
    redirect_to root_path
  end

  def upvote
    @story = Story.find(params[:id])
    @story.upvote_by(current_user)
    redirect_to :back
  end

  def downvote
    @story.downvote_by(current_user)
    redirect_to :back
  end


  private

  def story_params
    params.require(:story).permit(:body, :title, :category_id)
  end

  def find_story
    @story = Story.find(params[:id])
  end

end
