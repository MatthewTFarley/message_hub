class PostsController < ApplicationController
  def index
    @posts = Post.all.order(created_at: :desc)
  end

  def show
    @post = Post.find(params[:id])
  end

  def new
    @post = Post.new
    authorize @post
  end

  def create
    @post = Post.new(post_params.merge(author: current_user))
    authorize @post

    if @post.save
      flash[:notice] = 'Post was created.'
      redirect_to @post
    else
      flash[:error] = 'Error while creating post. Please try again.'
      render :new
    end
  end

  def edit
    @post = Post.find(params[:id])
    authorize @post
  end

  def update
    @post = Post.find(params[:id])
    authorize @post

    if @post.update_attributes(post_params)
      flash[:notice] = 'Post was updated.'
      redirect_to @post
    else
      flash[:error] = 'There was an error saving the post. Please try again.'
      render :edit
    end
  end

  def destroy
    @post = Post.find(params[:id])
    authorize @post

    if @post.destroy
      flash[:notice] = 'Post was deleted.'
      redirect_to posts_path
    else
      flash[:error] = 'There was an error deleting the post. Please try again.'
      render @post
    end
  end

  private

  def post_params
    params.require(:post).permit(:title, :body)
  end
end
