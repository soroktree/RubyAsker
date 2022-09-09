class QuestionsController < ApplicationController
  before_action :set_question, only: %i[ show edit update destroy ]

  # GET /questions or /questions.json
  def index
    @questions = Question.all
  end

  # GET /questions/1 or /questions/1.json
  def show
    @answer = @question.answers.build
    @answers = @question.answers.order(created_at: :desc)
    @answers = Answer.where(question: @question).order(created_at: :desc)
  end

  # GET /questions/new
  def new
    @question = Question.new
  end

  # GET /questions/1/edit
  def edit
  end

  # POST /questions or /questions.json
  def create
    @question = current_user.questions.build question_params
    if @question.save
      flash[:success] = 'Question created!'
      redirect_to questions_path
        # redirect_to questions_url(@question)
    else
      render :new
    end
  end

  # PATCH/PUT /questions/1 or /questions/1.json
  def update
      if @question.update(question_params)
        flash[:success] = 'Question ipdated!'
        redirect_to questions_path
      else
        render :new
       end

  end

  # DELETE /questions/1 or /questions/1.json
  def destroy
    @question.destroy
    redirect_to questions_path
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_question
      @question = Question.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def question_params
      params.require(:question).permit(:title, :body, :user_id)
    end
end
