class QuestionsController < ApplicationController
  before_action :require_authentication, except: %i[show index]
  before_action :set_question, only: %i[ show edit update destroy ]

  before_action :authorize_question!
  after_action :verify_authorized # методе pundit проверяющий были ли установлены права доступа

  before_action :fetch_tags, only: %i[new edit]

  def index
    # @pagy, @questions = pagy Question.includes(:user, :question_tags, :tags).
    @pagy, @questions = pagy Question.all_by_tags(params[:tag_ids])
  end

  def show
    @answer = @question.answers.build
    @commentquestions = @question.commentquestions.build
    @pagy, @answers = pagy @question.answers.order(created_at: :desc)
  end

  def new
    @question = Question.new
  end

  def edit
  end

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

  def update
      if @question.update(question_params)
        flash[:success] = 'Question ipdated!'
        redirect_to questions_path
      else
        render :new
       end
  end

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
      params.require(:question).permit(:title, :body, tag_ids: [])
    end

    def fetch_tags
      @tags = Tag.all 
    end

    def authorize_question!
        authorize(@question || Question)
    end

end
