class TopicsController < ApplicationController
  def index
    @topics = Topic.all
  end

  def show
    @topic = Topic.find(params[:id])
    @posts = @topic.posts
  end

  def new
    @topic = Topic.find(params[:id])
  end

  def edit
  end

  def topic_params
    params.require(:topic).permit(:title)
  end
end
