class PostsController < ApplicationController
  before_action :authenticate_admin!, only: [:new,:create]
  def index
    @posts = Post.all
  end
  def new
    @post = Post.new
  end
  def create
    @post = Post.new(post_parms)
  if @post.save
      flash[:succes] = "Posted succesfully"
      redirect_to root_url
    else
      flash[:danger] = "Somthing went wrong"
      redirect_to root_url
    end
  end
private
  def post_parms
     params.require(:post).permit(:title,:content)
  end
end
