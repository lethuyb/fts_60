class QuestionsController < ApplicationController
  #load_and_authorize_resource
  before_action :load_subjects, only: [:new, :create]

  def index
    @questions = current_user.questions.order(created_at: :desc).page(params[:page]).per Settings.number
  end

  def new
    @subjects = Subject.all
    @question = Question.new
    @question.answers.build
  end

  def create
    @question = Question.new question_params
    if @questions.save
      flash[:success] = "questions created"
      redirection_to questions_path
    else
      render :new
    end
  end

  private
  def question_params
    params.require(:questions).permit :content, :subject_id, :user_id,
      :question_type, :status,
      answers_attributes: [:id, :correct, :content, :destroy]
  end

  def load_subjects
    @subjects = Subject.all
  end
end
