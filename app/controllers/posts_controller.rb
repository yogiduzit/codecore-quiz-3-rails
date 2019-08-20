class PostsController < ApplicationController
  before_action :find_post, only: [:show]
  before_action :authenticate_user!, except: [:show, :index]
  before_action :authorize_user!, only: [:update, :destroy]

  def create
    post = Post.new post_params
    post.user = current_user

    if post.save
      render(json: {post: post, status: 200}, status: 200)
    else
      render(json: {errors: post.errors.full_messages, status: 422}, status: 422)
    end
  end

  def index
    posts = Post.all.order(created_at: :desc)

    render(json: {posts: posts}, status: 200)
  end

  def show
    render(json: @post, status: 200, each_serializer: PostSerializer, include: "**" )
  end

  def update
    if @post.update post_params
      render(json: { post: @post }, status: 200)
    else
      render(json: {errors: @post.errors.full_messages})
    end
  end

  def destroy
    @post.destroy
    render(json: {message: "Sucessfully deleted"}, status: 200)
  end

  private
  def post_params
    params.require(:post).permit(:title, :body)
  end

  def find_post
    @post = Post.find(params[:id])
  end

  def authorize_user!
    @post = Post.find(params[:id])
    unless can?(:crud, @post)
      render(json: {message: "You are not authorized to complete this action", status: 401}, status: 401)
    end
  end

end
