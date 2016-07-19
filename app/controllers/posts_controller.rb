class PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update, :destroy, :true_answer, :false_answer]

  # GET /posts
  def index
    @posts = Post.all
    @answers = find_answers(@posts) 
  end

  # GET /posts/1
  def show
    @post = Post.find(params[:id])
    @answers = find_answers([@post])
  end

  # GET /posts/new
  def new
    @post = Post.new
  end

  # POST /posts
  def create
    @post = Post.new(post_params)
    if @post.save
      redirect_to @post
    else
      render :new
    end
  end
  
  # GET /true_answer
  def true_answer
    answer(true)
  end
  
  # GET /false_answer
  def false_answer
    answer(false)
  end

  # GET /random_post
  def random 
    @post = Post.random
    @answers = find_answers([@post])
  end

  private
    def answer(user_answer)
      @answer = UserAnswer.create(answer: user_answer, user_id: current_user.id, post_id: params[:id].to_i)
      @answer.save
      @current_answer = @post.user_answers.find_by(user_id: current_user.id).answer == @post.answer
    end
    
    def find_answers(posts)
      if user_signed_in?
        answers = Hash.new
        posts.each do |post|
          if (!post.user_answers.find_by(user_id: current_user.id).nil?)
            answers[post.id] = post.user_answers.find_by(user_id: current_user.id).answer == post.answer
          end
        end
        return answers
      end
    end

    def set_post
      @post = Post.find(params[:id])
    end

    def post_params
      params.require(:post).permit(:body, :answer, :comment, :link, :rate, :count_favourite)
    end
end
