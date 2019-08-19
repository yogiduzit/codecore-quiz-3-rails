class PostsController < ApplicationController
  before_action :find_post, only: [:show, :update, :destroy]

  def create
    post = Post.new post_params

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
    render(json: {post: @post}, status: 200)
  end

  def update
    if @post.update post_params
      render(json: { post: @post }, status: 200)
    else
      render(json: {errors: @post.errors.full_messages})
    end
  end

  def delete
    @post.destroy
    render(json: {post: @post}, status: 200)
  end

  private
  def post_params
    params.require(:post).permit(:title, :body)
  end

  def find_post
    @post = Post.find(params[:id])
  end

end
