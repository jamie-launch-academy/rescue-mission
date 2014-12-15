class QuestionsController < ApplicationController
  def new
    @question = Question.new
  end

  def create
    @question = Question.new(question_params)

    if @question.save
      flash[:success] = "Question entered successfully!"
      redirect_to @question
    else
      flash[:error] = "Error"
      render 'new'
    end
  end

  def show
    @question = Question.find(params[:id])
  end

  def index
    @question = Question.all
  end

  private
  def question_params
    params.require(:question).permit(:title, :description)
  end

end
