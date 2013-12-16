class TopicsController < ApplicationController
  def index
    @topics = Topic.all
  end

  def show
    @topic = Topic.find(params[:id])
    @posts = @topic.posts.includes(:user)
  end

  def new
    @topic = Topic.new
    authorize! :create, Topic, message: "You need to be a member to add a topic =^_^="
  end

  def create
    @topic = Topic.new(params[:topic_id])
    @topic = current_user.topics.build(topic_params)

    authorize! :create, @topic, message: "You need to be a member to add a topic =^_^="
    if @topic.save
      flash[:notice] = "Topic was saved."
      redirect_to @topic
    else
      flash[:error] = "There was a problem saving your Topic. Please try again =^_^="
      render :new
    end
  end

  def edit
    @topic = Topic.find(params[:id])
    authorize! :update, @topic, message: "You need to be an admin to do that."
  end

  def topic_params
    params.require(:topic).permit(:title)
  end
end
