class ResponsesController < ApplicationController

  def new
  end

  def create

    @question = Question.find(params[:question_id])
    @response = Response.new(response_params)
    @response.post_id = params[:question_id]

    if @response.save
      flash[:message] = "You have successfully posted a message"
      redirect_to @question
    else
      render 'questions/show'
    end
  end

  private
  def response_params
    params.require(:response).permit(:message)
  end

end
