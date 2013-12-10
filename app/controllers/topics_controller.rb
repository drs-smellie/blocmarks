class TopicsController < ApplicationController
  def index
    @topics = Topic.all
  end

  def show
    @topic = Topic.find(params[:id])
    @posts = @topic.posts
  end

  def new
    @topic = Topic.new
  end

  def create
    @topic = Topic.new(topic_params)
    if @topic.save
      flash[:notice] = "Topic was saved."
      redirect_to @topic
    else
      flash[:error] = "There was a problem saving your Topic. Please try again."
      render :new
    end
  end

  def edit
  end

  def topic_params
    params.require(:topic).permit(:title)
  end
end
