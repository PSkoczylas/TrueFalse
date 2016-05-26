class PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update, :destroy, :true_answer]

  # GET /posts
  # GET /posts.json
  def index
    @posts = Post.all
  end

  # GET /posts/1
  # GET /posts/1.json
  def show
    @post = Post.find(params[:id])
  end

  # GET /posts/new
  def new
    @post = Post.new
  end

  # POST /posts
  # POST /posts.json
  def create
    @post = Post.new(post_params)

    respond_to do |format|
      if @post.save
        format.html { redirect_to @post, notice: 'Post został dodany' }
        format.json { render :show, status: :created, location: @post }
      else
        format.html { render :new }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  def true_answer
    answer(true)
    
  end
  
  def false_answer
    answer(false)
  end

  def random_post 
    @post = Post.random
    respond_to do |format|
      format.html { redirect_to @post }
    end
  end

  private
    def answer(user_answer)
      @answer = UserAnswer.create(answer: user_answer, user_id: current_user.id, post_id: params[:id].to_i)
      @answer.save
      redirect_to posts_url
    end
    # Use callbacks to share common setup or constraints between actions.
    def set_post
      @post = Post.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def post_params
      params.require(:post).permit(:body, :answer, :comment, :link, :rate, :count_favourite)
    end
end
