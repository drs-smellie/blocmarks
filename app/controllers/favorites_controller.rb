class FavoritesController < ApplicationController
def create
    @topic = Topic.find(params[:topic_id])
    @post = @topic.posts.find(params[:post_id])

    authorize! :create, Favorite, messsage: "You cannot do that!"
    favorite = current_user.favorites.create(post: @post)
    if favorite.valid?
      flash[:notice] = "Favorited post"
      redirect_to [@topic]      
    else
      flash[:error] = "Unable to add favorite. Please try again."
      redirect_to [@topic]
    end
  end

  def destroy
  @topic = Topic.find(params[:topic_id])
  @post = @topic.posts.find(params[:post_id])
  @favorite = current_user.favorites.find(params[:id])

    authorize! :destroy, @favorite, message: "You cannot do that!"
    if @favorite.destroy
      flash[:notice] = "Removed favorite."
      redirect_to [@topic]
   else
      flash[:error] = "Unable to remove favorite. Please try again."
      redirect_to [@topic]
    end
  end
end