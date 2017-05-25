class PostsController < ApplicationController
  before_action :authenticate_admin!, only: [:new,:create]
  #Get all posts
  def index
    getAll

    @posts = @allPosts.paginate(:page => params[:page], :per_page => 10)
  end
  #Get new post form
  def new
    @post = Post.new
  end
#create new post if post is valid
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
  def edit
    find_post
  end
  def destroy
    find_post
    @post.destroy
    flash[:success] = "Post deleted succesfully"
    redirect_to root_url
  end
  def update
    find_post
    @post.update(post_parms)
    if @post.save
        flash[:succes] = "Edited succesfully"
        redirect_to root_url
      else
        flash[:danger] = "Somthing went wrong"
        redirect_to root_url
      end
  end
  def archived
    @posts = Post.order(id: :desc).where("strftime('%m', created_at) = ? AND strftime('%Y', created_at) = ?","0#{created_params[:month]}",created_params[:year]).paginate(:page => params[:page], :per_page => 5)
     getAll
  end
  def tag
     @tag = tag_params[:tags]
    @posts = Post.order(id: :desc).where("tags LIKE ?","%#{tag_params[:tags]}%").paginate(:page => params[:page], :per_page => 10)
    getAll
  end

  def getAll
   @allPosts = Post.order(id: :desc).all
   end
private
#Strong parame
  def post_parms
     params.require(:post).permit(:title,:content,:tags)
  end
  def created_params
    params.permit(:month,:year)
    end
    def tag_params
    params.permit(:tags)
    end
  #FInd right post to edit/destroy
  def find_post
    @post = Post.find(params[:id])
  end
end
