class QuestionsController < ApplicationController
  def new
    @question = Question.new
  end

  def create
    @question = Question.new(question_params)

    if @question.save
      flash[:message] = "Question entered successfully!"
      redirect_to @question
    elsif @question.description.empty? && @question.title.empty?
      flash[:message] = "You must provide a title and description"
      render 'new'
    elsif @question.title.empty?
      flash[:message] = "You must provide a title"
      render 'new'
    elsif @question.description.empty?
      flash[:message] = "You must provide a description"
      render 'new'
    else
      flash[:message] = 'Please make sure title has at least 10 characters and
                        description has at least 50 character'
      render 'new'
    end
  end

  def show
    @question = Question.find(params[:id])
  end

  def index
    @question = Question.all.order ('created_at DESC')
  end

  private
  def question_params
    params.require(:question).permit(:title, :description)
  end

end
