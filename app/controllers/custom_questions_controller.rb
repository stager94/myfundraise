class CustomQuestionsController < ApplicationController

  def create
    @question = CustomQuestion.create permitted_params
    redirect_to :back
  end

  private

  def permitted_params
    params.require(:custom_question).permit!
  end

end
