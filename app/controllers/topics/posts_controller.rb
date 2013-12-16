class Topics::PostsController < ApplicationController
  def show
    @topic = Topic.find(params[:topic_id])
    @post = Post.find(params[:id])
  end

  def new
    @topic = Topic.find(params[:topic_id])
    @post = Post.new
    authorize! :create, Post, message: "You need to be a member to add a link =^_^="

  end

  def create
    @topic = Topic.find(params[:topic_id])
    @post = Post.new(post_params)
    @post = current_user.posts.build(post_params)
    @posts = @topic.posts

    @post.topic = @topic
    authorize! :create, @post, message: "You need to be a member to add a link =^_^="
    if @post.save
      flash[:notice] = "Post was saved."
      redirect_to [@topic]
    else
      flash[:error] = "There was a problem saving your link. Please try again =^_^="
      render :new
    end
  end

  def edit
  end

  def post_params
    params.require(:post).permit(:url)
  end

end
