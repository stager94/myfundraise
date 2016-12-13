class StaticController < ApplicationController

  def how_it_works
  end

  def questions
    @questions = params[:search].present? ? Question.search_for(params[:search]) : Question.all
  end

  def pricing
  end

  def terms_of_use
  end

  def privacy_policy
  end

  def send_question

  end

end
