class Topics::PostsController < ApplicationController
  def show
    @topic = Topic.find(params[:topic_id])
    @post = Post.find(params[:id])
  end

  def new
    @topic = Topic.find(params[:topic_id])
    @post = Post.new
  end

  def create
    @topic = Topic.find(params[:topic_id])
    @post = Post.new(post_params)
    @post.topic = @topic
    if @post.save
      flash[:notice] = "Post was saved."
      redirect_to [@topic, @post]
    else
      flash[:error] = "There was a problem saving your Post. Please try again."
      render :new
    end
  end

  def edit
  end

  def post_params
    params.require(:post).permit(:url)
  end

end
