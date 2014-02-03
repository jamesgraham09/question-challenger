class QuestionsController < ApplicationController

  before_action :get_question, only: [:show, :edit, :update, :destroy, :answer]

  # GET /questions
  def index
    @questions = Question.all
  end

  # GET /questions/1
  def show
  end

  # GET /questions/new
  def new
    @question = Question.new
  end

  # GET /questions/1/edit
  def edit
  end

  # POST /questions
  def create
    @question = Question.new(question_params)
    @question.save
    redirect_to question_path(@question)
  end

  # PATCH/PUT /questions/1
  def update
  end

  # DELETE /questions/1
  def destroy
    @question.destroy
  end

  def randomize
    @question = Question.all.sample
    redirect_to question_path(@question)
  end

  def answer
    flash[:notice] = 'Correct' if params[:Answer] == @question.answers.first.text
    redirect_to action: :randomize
  end

  private
  def get_question
    @question = Question.find(params[:id])
  end

  def question_params
    params.require(:question).permit(:text)
  end
end
