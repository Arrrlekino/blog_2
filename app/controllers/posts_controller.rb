class PostsController < ApplicationController
  def index
  end
  
  def show
    
  end

  def new
    @topics = Topic.all()
  end
   def create
     @post = Post.new(params.require(:post).permit(:title, :body, :topic_id))
     @post.save
     redirect_to '/posts/' + @post.id.to_s
   end
end
